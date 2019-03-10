from flask import Flask, jsonify, request

app = Flask(__name__)

_version = {'name': 'API Python', 'version': '1.0.0'}

_lstContatos = [{'nome': 'Heitor Gonzaga', 'telefone': '(63)0000-0000'},
                {'nome': 'Polyana Silva Moura', 'telefone': '(63)1111-0000'},
                {'nome': 'Isabela Silva Moura', 'telefone': '(63)1111-1111'}]


@app.route('/')
def version():
    return jsonify(_version), 200


@app.route('/contatos')
def contatos():
    return jsonify(_lstContatos), 200


if(__name__ == '__main__'):
    app.run(debug=True, host='192.168.0.105')
