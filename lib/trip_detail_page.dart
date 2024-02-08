import 'package:flutter/material.dart';

import 'trip.dart';

class TripDetailsPage extends StatelessWidget {
  final Trip trip;

  const TripDetailsPage({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Selected Restaurants:'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trip.selectedRestaurants.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(trip.selectedRestaurants[index]),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Selected Cafes:'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trip.selectedCafes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(trip.selectedCafes[index]),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Selected Entertainment:'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trip.selectedEntertainment.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(trip.selectedEntertainment[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}