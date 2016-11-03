from flask import Flask, request, render_template
app = Flask(__name__)

@app.route("/")
def main():
	return render_template("index.html")

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
	
	

