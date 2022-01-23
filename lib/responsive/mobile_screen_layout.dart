// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileCsreenLayout extends StatefulWidget {
  const MobileCsreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileCsreenLayout> createState() => _MobileCsreenLayoutState();
}

class _MobileCsreenLayoutState extends State<MobileCsreenLayout> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    //print(snap.data());
    setState(() {
      userName = (snap.data() as Map<String, dynamic>)['userName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hey👋 $userName, Welcome to Mobile Home Screen Layout'),
      ),
    );
  }
}
