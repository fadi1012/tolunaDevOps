from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    # devidebyzero = 10/0
    return 'Hello Toluna Team!!!'


if __name__ == '__main__':
    app.run(debug=True)
