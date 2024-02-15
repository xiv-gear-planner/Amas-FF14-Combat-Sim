import os
import time

from flask import Flask

import coresimulator

app = Flask(__name__)


@app.route("/", methods=['GET'])
def hello_world():
    return "Hello World!"


@app.route("/long", methods=['GET'])
def long():
    print('start')
    time.sleep(15)
    print('end')
    return "Hello World!"


@app.route("/sim", methods=['GET'])
def simulate():
    print('start')
    result = coresimulator.coreSimMain()
    print('end')
    return '<pre>' + '\n'.join(result) + '</pre>'


port = int(os.environ.get('SERVER_PORT', 8080))
app.run(host='0.0.0.0', port=port, threaded=True)
