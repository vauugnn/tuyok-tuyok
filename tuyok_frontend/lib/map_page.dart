import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tuyok_mobile/widgets/footer.dart';
import 'package:tuyok_mobile/feed_page.dart';
import 'package:tuyok_mobile/profile_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double fare = 0.0;
  String vehicleType = 'jeep';
  bool isDiscount = false;
  TextEditingController distanceController = TextEditingController();

  void calculateFare() async {
  var url = 'http://127.0.0.1:5000/calculate_fare';
  var uri = Uri.parse(url);

  var requestBody = {
    'vehicle_type': vehicleType,
    'distance': double.parse(distanceController.text),
    'is_discount': isDiscount,
  };

  print('Request Body: $requestBody');

  try {
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      double receivedFare = data['fare'].toDouble();  
      print('Received fare: $receivedFare');
      setState(() {
        fare = receivedFare;
    });
    print('Updated fare: $fare');
  }
  } catch (e) {
    print('Exception occurred: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fare Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Distance (in km):',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: distanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Distance',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Vehicle Type:',
              style: TextStyle(fontSize: 18),
            ),
            RadioListTile(
              title: const Text('Jeep'),
              value: 'jeep',
              groupValue: vehicleType,
              onChanged: (value) {
                setState(() {
                  vehicleType = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('Van'),
              value: 'van',
              groupValue: vehicleType,
              onChanged: (value) {
                setState(() {
                  vehicleType = value.toString();
                });
              },
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Are you a student, senior citizen, or PWD?'),
              value: isDiscount,
              onChanged: (value) {
                setState(() {
                  isDiscount = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateFare,
              child: const Text('Calculate Fare'),
            ),
            const SizedBox(height: 16),
            Text(
              'Calculated Fare: ₱${fare.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0: // Map (no action needed, already on this page)
              break;
            case 1: // Feed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedPage()),
              );
              break;
            case 2: // Profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}