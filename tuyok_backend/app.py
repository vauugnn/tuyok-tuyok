from flask import Flask, request, jsonify
from flask_cors import CORS
from fare_calculator import calculate_fare
from map_points import davao_coords, map_points

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


@app.route('/map', methods=['GET'])
def map_route():
    davao_city_coords = davao_coords()
    return jsonify({'davao_city_coords': davao_city_coords})


@app.route('/map_points', methods=['POST'])
def map_points_route():
    data = request.get_json()
    location1 = data['location1']
    location2 = data['location2']

    coords = map_points(location1, location2)
    if coords:
        return jsonify({'coords': coords})
    else:
        return jsonify({'error': 'Unable to find one or both locations.'}), 400
    

if __name__ == '__main__':
        app.run(host='0.0.0.0', port=5000)