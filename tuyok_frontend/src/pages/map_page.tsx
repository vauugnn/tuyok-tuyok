import React, { useState } from 'react';
import axios from 'axios';

const MapPage: React.FC = () => {
  const [fare, setFare] = useState<number>(0);
  const [vehicleType, setVehicleType] = useState<'jeep' | 'van'>('jeep');
  const [isDiscount, setIsDiscount] = useState<boolean>(false);
  const [distance, setDistance] = useState<string>('');

  const calculateFare = async () => {
    const url = 'http://127.0.0.1:5000/calculate_fare';

    const requestBody = {
      vehicle_type: vehicleType,
      distance: parseFloat(distance),
      is_discount: isDiscount,
    };

    console.log('Request Body:', requestBody);

    try {
      const response = await axios.post(url, requestBody);

      console.log('Response Status:', response.status);
      console.log('Response Data:', response.data);

      if (response.status === 200) {
        const receivedFare = response.data.fare;
        console.log('Received fare:', receivedFare);
        setFare(receivedFare);
        console.log('Fare state updated:', receivedFare);
      }
    } catch (error) {
      if (axios.isAxiosError(error)) {
        console.error('Axios error:', error.message);
        if (error.response) {
          console.error('Error data:', error.response.data);
          console.error('Error status:', error.response.status);
        } else if (error.request) {
          console.error('No response received:', error.request);
        } else {
          console.error('Error', error.message);
        }
      } else {
        console.error('Unexpected error:', error);
      }
    }
  };

  return (
    <div>
      <h1>Fare Calculator</h1>
      <div>
        <label htmlFor="distance">Enter Distance (in km):</label>
        <input
          type="number"
          id="distance"
          value={distance}
          onChange={(e) => setDistance(e.target.value)}
          placeholder="Distance"
        />
      </div>
      <div>
        <p>Select Vehicle Type:</p>
        <label>
          <input
            type="radio"
            value="jeep"
            checked={vehicleType === 'jeep'}
            onChange={() => setVehicleType('jeep')}
          />
          Jeep
        </label>
        <label>
          <input
            type="radio"
            value="van"
            checked={vehicleType === 'van'}
            onChange={() => setVehicleType('van')}
          />
          Van
        </label>
      </div>
      <div>
        <label>
          <input
            type="checkbox"
            checked={isDiscount}
            onChange={(e) => setIsDiscount(e.target.checked)}
          />
          Are you a student, senior citizen, or PWD?
        </label>
      </div>
      <button onClick={calculateFare}>Calculate Fare</button>
      <p>Calculated Fare: ₱{fare.toFixed(2)}</p>
    </div>
  );
};

export default MapPage;