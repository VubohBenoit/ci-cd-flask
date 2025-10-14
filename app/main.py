from flask import Flask, jsonify
from app.utils import add, greet


app = Flask(__name__)


@app.route('/')
def index():
    return jsonify({"message": greet('world'), "sum": add(2, 3)})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)
