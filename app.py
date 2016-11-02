from flask import Flask, request, render_template
app = Flask(__name__)

@app.route("/")
def hell():
	return render_template("index.html")

@app.route("/hello/")
@app.route("/hello/<name>", methods = ['GET'])
def hello(name=None):
	name = request.args.get("name")
	return render_template("hello.html", name=name)
	



if __name__ == "__main__":
	app.run()
	
	

