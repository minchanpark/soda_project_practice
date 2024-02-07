import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app_state.dart';
import 'trip_detail_page.dart';

class SelectedItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myAppState = Provider.of<MyAppState>(context); // 수정

    return Scaffold(
      appBar: AppBar(
        title: Text('View Trips'),
      ),
      body: ListView.builder(
        itemCount: myAppState.trips.length,
        itemBuilder: (context, index) {
          final trip = myAppState.trips[index];
          return ListTile(
            title: Text(trip.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TripDetailsPage(trip: trip)),
              );
            },
          );
        },
      ),
    );
  }
}