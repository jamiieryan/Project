from flask import Flask, request, render_template, redirect, url_for

app = Flask(__name__)



# route for handling the login page logic
@app.route('/', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != 'admin' or request.form['password'] != 'admin':
            error = 'Invalid Credentials. Please try again.'
        else:
            return redirect(url_for('index'))
    return render_template('login.html', error=error)


@app.route("/index")
def index():
	return app.send_static_file("index.html")

@app.route("/route2")
def route2():
	return render_template("route2.html")

@app.route("/route3")
def route3():
	return render_template("route3.html")

@app.route("/route4")
def route4():
	return render_template("route4.html")



#@app.route("/hello/")
#@app.route("/hello/<name>", methods = ['GET'])
#def hello(name=None):
#	name = request.args.get("name")
#	return render_template("hello.html", name=name)
	



if __name__ == "__main__":
	app.run()
	
	

