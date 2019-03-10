from flask import Flask, jsonify, request

app = Flask(__name__)

_version = {'name': 'API Python', 'version': '1.0.0'}


@app.route('/')
def version():
    return jsonify(_version), 200


if(__name__ == '__main__'):
    app.run(debug=True, host='192.168.0.105')
