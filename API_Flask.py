from flask import Flask, jsonify, request
from flask_ngrok import run_with_ngrok
import json


app = Flask(__name__)
run_with_ngrok(app)  # Start ngrok when app is run


def getImc(peso, altura):
    altura = altura/100
    imc = (peso/altura**2)
    return imc


def getIndicativo(imc):
    # Abaixo do Peso
    if 18.5 > imc:
        return '1'
    # Peso Normal
    if 24.9 > imc:
        return '2'
    # Sobrepeso
    if 29.9 > imc:
        return '3'
    # Obesidade 1
    if 34.9 > imc:
        return '4'
    # Obesidade 2
    if 39.9 > imc:
        return '5'
    # Obesidade 3
    return '6'


@app.route("/TreinoIndicado")
def home():

    request_data = request.args.get('params')
    data = json.loads(request_data)

    peso = int(data['peso'])
    altura = int(data['altura'])

    imc = getImc(peso, altura)
    indicativo = getIndicativo(imc)

    return json.dumps({'imc': f'{indicativo}'})


app.run()