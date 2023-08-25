import 'dart:js_interop';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Kusrc_table/firebase_options.dart';


class AppearMenu_Detail{
  Future<void> GetData() async {
    final firestore = FirebaseFirestore.instance;
    try {
      // Assuming you have a collection called 'data' and a document called 'documentID'
      DocumentSnapshot snapshot = await firestore.collection('บุคลากร').doc('uIo2o7S7sXTPFw26aCan').get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        
        // Process the data as needed
        print(data);
      } 
      else {
        print("Document does not exist");
      }
    } 
    catch (e) {
      print("Error fetching data: $e");
    }
  }
}

// Future<void> fetchData() async {
//   final firestore = FirebaseFirestore.instance;
//   try {
//     // Assuming you have a collection called 'data' and a document called 'documentID'
//     DocumentSnapshot snapshot = await firestore.collection('บุคลากร').doc('uIo2o7S7sXTPFw26aCan').get();

//     if (snapshot.exists) {
//       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      
//       // Process the data as needed
//       print(data);
//     } else {
//       print("Document does not exist");
//     }
//   } 
//   catch (e) {
//     print("Error fetching data: $e");
//   }
// }
// final nname = fetchData();

//Query name = FirebaseFirestore.instance;

final name = 'เจนนิสา เรืองศรี';
final rank = 'ผู้จัดตารางสอน';
final urlImage =
    'https://pbs.twimg.com/media/FDweL4tUYAIZOqs.jpg:large';
