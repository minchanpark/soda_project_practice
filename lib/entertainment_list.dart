import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_project_practice/Trip.dart';
import 'package:soda_project_practice/my_app_state.dart';
import 'firestore3.dart';
import 'selected_item_page.dart';

class EntertainmentList extends StatelessWidget {
  const EntertainmentList({super.key});

  @override
  Widget build(BuildContext context) {
    final FireStoreServiceEntertainment firestoreService =
        FireStoreServiceEntertainment();
    Trip appState = Provider.of<Trip>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('놀거리'),
        actions: [
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: const Text('저장 하시겠습니까?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('취소'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedItemsPage())),
                    child: const Text('저장'),
                  ),
                ],
              ),
            ),
            child: const Text('저장'),
          ),
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
                  DocumentSnapshot documentSnapshot =
                      sortedNotesListSmall[index];

                  Map<String, dynamic> data =
                      documentSnapshot.data() as Map<String, dynamic>;

                  String name = data['name'];
                  int price = data['price'];

                  //print(name.toString());

                  return Card(
                    child: ListTile(
                      title: Text(name),
                      subtitle: Text("${price.toString()}원"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                appState.addEntertainment(name);
                              },
                              icon: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Text('No notes...');
          }
        },
      ),
    );
  }
}
