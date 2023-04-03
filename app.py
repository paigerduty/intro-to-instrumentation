import random
import os
from flask import Flask

app = Flask(__name__)

HITS = 0

@app.route('/visit')
def hello():
    global HITS
    HITS = HITS + 1
    return f'This webpage has been viewed {HITS} times'

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route("/rolldice")
def roll_dice():
    return str(do_roll())

def do_roll():
    return random.randint(1, 6)

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)
