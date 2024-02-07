import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_project_practice/Trip.dart';
import 'package:soda_project_practice/entertainment_list.dart';
import 'package:soda_project_practice/my_app_state.dart';
import 'firestore2.dart';

class CafeList extends StatelessWidget {
  const CafeList({super.key});

  @override
  Widget build(BuildContext context) {
    final FirestoreServiseCafes firestoreService = FirestoreServiseCafes();
    Trip appState = Provider.of<Trip>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('카페'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (constext) => const EntertainmentList()));
              },
              child: const Text('next page'))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            List<DocumentSnapshot> sortedNotesListLarge = List.from(notesList);
            //price가 큰 순서대로 listtile을 정렬
            sortedNotesListLarge.sort((a, b) {
              int priceA = a['price'];
              int priceB = b['price'];
              return priceB.compareTo(priceA);
            });

            List<DocumentSnapshot> sortedNotesListSmall = List.from(notesList);
            //price가 작은 순서대로 listtile을 정렬
            sortedNotesListSmall.sort((a, b) {
              int priceA = a['price'];
              int priceB = b['price'];
              return priceA.compareTo(priceB);
            });

            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = sortedNotesListSmall[index];

                Map<String, dynamic> data =
                    documentSnapshot.data() as Map<String, dynamic>;

                String name = data['name'];
                int price = data['price'];

                return ListTile(
                  title: Text(name),
                  subtitle: Text("${price.toString()}원"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            appState.addCafe(name);
                          },
                          icon: Icon(Icons.add)),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('No notes...');
          }
        },
      ),
    );
  }
}
