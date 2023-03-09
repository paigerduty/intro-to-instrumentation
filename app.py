from flask import Flask
import random

app = Flask(__name__)

hits = 0

@app.route('/visit')
def hello():
    global hits
    hits = hits + 1
    return f'This webpage has been viewed {hits} times'

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route("/rolldice")
def roll_dice():
    return str(do_roll())

def do_roll():
    return random.randint(1, 6)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)


