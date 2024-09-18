from flask import Flask, request, jsonify
from flask_cors import CORS
from fare_calculator import calculate_fare

app = Flask(__name__)
CORS(app, resources={r"/calculate_fare": {"origins": "http://localhost:3000"}})

@app.route('/calculate_fare', methods=['POST'])
def calculate_fare_route():
    data = request.get_json()
    vehicle_type = data['vehicle_type']
    distance = float(data['distance'])
    is_discount = data['is_discount']

    fare = calculate_fare(vehicle_type, distance, is_discount)
    return jsonify({'fare': float(fare)})

if __name__ == '__main__':
        app.run(host='0.0.0.0', port=5000)