import cgi
from datetime import datetime
from flask import Flask, render_template, json, request,redirect,session
from flaskext.mysql import MySQL
from werkzeug import generate_password_hash, check_password_hash

mysql = MySQL()
app = Flask(__name__)
app.secret_key = 'why would I tell you my secret key?'

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'Project'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)




# route specification for handling navigation
@app.route("/")
def landing():
	return render_template("signin.html")

@app.route("/index")
def index():
	return app.send_static_file("index.html")

@app.route("/about")
def about():
	return render_template("about.html")



################ NEWS ARTICLES ########################

@app.route("/route2")
def route2():
	return render_template("route2.html")

@app.route("/route3")
def route3():
    conn = mysql.connect()
    cursor = conn.cursor()

    #get user_name where user_id = loggedin_id
    cursor.execute("select title from art where id = 2")

    #store response from cursor in user_name variable and format to string
    title = str(cursor.fetchone()[0]) 


    #get user bio where user_id = loggedin_id
    cursor.execute("select body from art where id = 2")

    #store response from bio cursor in variable and format to string
    body = str(cursor.fetchone()[0])
    
    cursor.close()
    conn.close()
    
    return render_template("route3.html",title = title, body = body)



@app.route("/route4")
def route4():
    conn = mysql.connect()
    cursor = conn.cursor()

    #get user_name where user_id = loggedin_id
    cursor.execute("select title from art where id = 3")

    #store response from cursor in user_name variable and format to string
    title = str(cursor.fetchone()[0]) 


    #get user bio where user_id = loggedin_id
    cursor.execute("select body from art where id = 3")

    #store response from bio cursor in variable and format to string
    body = str(cursor.fetchone()[0])
    
    cursor.close()
    conn.close()
    
    return render_template("route4.html", title = title, body = body)



@app.route("/route5")
def route5():
    conn = mysql.connect()
    cursor = conn.cursor()

    #get user_name where user_id = loggedin_id
    cursor.execute("select title from art where id = 4")

    #store response from cursor in user_name variable and format to string
    title = str(cursor.fetchone()[0]) 


    #get user bio where user_id = loggedin_id
    cursor.execute("select body from art where id = 4")

    #store response from bio cursor in variable and format to string
    body = str(cursor.fetchone()[0])
    
    cursor.close()
    conn.close()
    
    return render_template("route5.html", title = title, body = body)


#################################################################

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')

@app.route('/showSignin')
def showSignin():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('signin.html')

  
    

    
################################### USER PROFILE Controller
@app.route('/userHome') 
def userHome():
    #if there is a user present in the session
    if session.get('user'): 
        
        #store logged in user_id in variable        
        loggedin = session.get('user')
        
        #open db connection and initiate cursor
        conn = mysql.connect()
        cursor = conn.cursor()
        
        #get user_name where user_id = loggedin_id
        cursor.execute("select user_name from tbl_user where user_id = (%s)", loggedin)
        
        #store response from cursor in user_name variable and format to string
        user_name = str(cursor.fetchone()[0]) 
        
       
        #get user bio where user_id = loggedin_id
        cursor.execute("select bio from tbl_user where user_id = (%s)", loggedin)
        
        #store response from bio cursor in variable and format to string
        bio = str(cursor.fetchone()[0])
        
        
        #counts number of posts made by logged in user
        cursor.execute("select count(post_content) from user_posts where user_id = (%s)", loggedin)

        #stores post count in string variable 
        postCount = str(cursor.fetchone()[0])
        
        
        #if post count is = to 0 there are no posts to show 
        #this if statement is needed as if the user has no posts
        #and tries to log in to the application an error is thrown 
        #as it tries to format an empty string variable
        #leaving a user (that has no posts made) unable to log in to the application
        if postCount == "0":
            
            #stores the below string in the var if there are no posts
            postContent = "No Posts Yet!"
        
        #else get all posts made by that user
        else:
            #get user posts where user_id = loggedin_id
            cursor.execute("select post_content from user_posts where user_id = (%s)", loggedin)

            #store response from cursor in post variable and format to string
            postContent = str(cursor.fetchone()[0])
        
        
        #close db connection 
        cursor.close()
        conn.close()
        
            
        #render userHome.html template and pass above variables to the template
        return render_template('userHome.html', user_name = user_name, bio = bio, postContent = postContent)
    
    
    else:
        #otherwise render the error.html template
        return render_template('error.html',error = 'Unauthorized Access')


######################## POST FUNCTIONALITY FOR USER PROFILE 
    
@app.route('/userPost', methods=['POST']) 
def userPost(): #Handles user posts for User Profile 
    
    
    #get user_id of logged in user and store in variable
    loggedin = session.get('user')

    #get current time and store in variable
    time = str(datetime.now())

    #get postContent recieved from from on userHome.html and store in variable
    post = request.form['postContent'];

    #open database connection and initiate cursor
    conn = mysql.connect()
    cursor = conn.cursor()

    #insert variables into db as a record
    cursor.execute("""INSERT INTO user_posts VALUES (%s, %s, %s)""", (loggedin, time, post))
    conn.commit()

    #close db connection  
    cursor.close()
    conn.close()

    #used for debugging purposes
    return json.dumps({'status':'OK','user':loggedin,'time':time,'post':post});
    
    


    
    
    
############################# LOGOUT OF USER PROFILE   
@app.route('/logout')
def logout():
    
    #logs user out, kills session, redirects to root of application.
    session.pop('user',None)
    return redirect('/')







###################### HANDLES USER LOGIN FUNCTIONALITY 

###################### TUTORIALS USED FOR THIS SECTION 
# https://code.tutsplus.com/series/creating-a-web-app-from-scratch-using-python-flask-and-mysql--cms-827

@app.route('/validateLogin',methods=['POST'])
def validateLogin():
    try:
        _username = request.form['inputEmail']
        _password = request.form['inputPassword']
        
        
        # connect to mysql
        con = mysql.connect()
        cursor = con.cursor()
        
        #calls sql login procedure stored on db to handle user login
        cursor.callproc('sp_validateLogin',(_username,))
        data = cursor.fetchall()

        
        #validates user and sends them to their userProfile
        if len(data) > 0:
            if check_password_hash(str(data[0][3]),_password):
                session['user'] = data[0][0]
                return redirect('/userHome')
            
            # (for nested if)otherwise renders error template
            else:
                return render_template('error.html',error = 'Wrong Email address or Password.')
            
        #(outside nested if) if try fails, return error template
        else:
            return render_template('error.html',error = 'Wrong Email address or Password.')
            
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        con.close()

        
        
        

###################### HANDLES USER SIGNUP FUNCTIONALITY

###################### TUTORIALS USED FOR THIS SECTION 
# https://code.tutsplus.com/series/creating-a-web-app-from-scratch-using-python-flask-and-mysql--cms-827

@app.route('/signUp',methods=['POST','GET'])
def signUp():
    try:
        
        #retrieves user input from signup.html template
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']

        
        # validate the received values
        if _name and _email and _password:
            
            # All Good, let's call MySQL
            
            #open db connection
            conn = mysql.connect()
            cursor = conn.cursor()
            _hashed_password = generate_password_hash(_password)
            cursor.callproc('sp_createUser',(_name,_email,_hashed_password))
            
            #stores response in data variable
            data = cursor.fetchall()

            
            if len(data) is 0:
                conn.commit()
                return json.dumps({'message':'User created successfully !'})
            else:
                return json.dumps({'error':str(data[0])})
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'error':str(e)})
    finally:
        cursor.close() 
        conn.close()



if __name__ == "__main__":
	app.run()
	
	

