import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_project_practice/rest_list.dart';
import 'my_app_state.dart';
import 'selected_item_page.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController _tripNameController = TextEditingController();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final myAppState = Provider.of<MyAppState>(context); // 수정

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Trip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _tripNameController,
            decoration: const InputDecoration(
              labelText: 'Enter Trip Name',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              myAppState.addTrip(_tripNameController.text);
              _tripNameController.clear();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResturantListPage()));
            },
            child: const Text('Create Trip'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectedItemsPage()),
              );
            },
            child: const Text('View Trips'),
          ),
        ],
      ),
    );
  }
}
