import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageShowPage extends StatefulWidget {
  const ImageShowPage({super.key});

  @override
  State<ImageShowPage> createState() => _ImageShowPageState();
}

class _ImageShowPageState extends State<ImageShowPage> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;

  Future<void> getImageUrl() async {
    try {
      final ref = storage.ref().child('1.jpeg');
      final url = await ref.getDownloadURL();
      setState(() {
        imageUrl = url;
      });
    } catch (e) {
      print("Error getting image URL: $e");
    }
  }

  @override
  void initState(){
    super.initState();
    imageUrl='';
    getImageUrl();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display image from firebase firestore'),
      ),
      body: Column(
        children: 
        [
          SizedBox(height: 300, 
          child: Image(image: NetworkImage(imageUrl), fit: BoxFit.cover,),)
        ],
      ),
    );
  }
}