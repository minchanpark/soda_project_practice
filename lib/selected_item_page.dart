import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'my_app_state.dart';
import 'view_trip.dart';

class SelectedItemsPage extends StatelessWidget {
  const SelectedItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppState myAppState = Provider.of<MyAppState>(context); // 수정

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Trips'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (constext) => MyHomePage()));
              },
              child: const Text('go to home'))
        ],
      ),
      body: ListView.builder(
        itemCount: myAppState.trips.length,
        itemBuilder: (context, index) {
          final trip = myAppState.trips[index];
          return ListTile(
            title: Text(trip.name),
            trailing:
                IconButton(icon: const Icon(Icons.delete), onPressed: () {showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                  content: const Text('삭제 하시겠습니까?'),
                  actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('취소'),
                  ),
                  TextButton(
                    onPressed: (){ myAppState.deleteTrip(trip.name); Navigator.pop(context);},
                    child: const Text('삭제'),
                  ),
                ],
                ));}),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewTripPage(trip: trip)),
              );
            },
          );
        },
      ),
    );
  }
}
