import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class RegionalLeagues extends StatefulWidget {
  const RegionalLeagues({Key? key}) : super(key: key);

  @override
  State<RegionalLeagues> createState() => _RegionalLeaguesState();
}

class _RegionalLeaguesState extends State<RegionalLeagues> {
  final Stream<QuerySnapshot> regionalLeagues = FirebaseFirestore.instance.collection('ligues_regionales').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: regionalLeagues,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Ligues Régionales".toUpperCase()),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
            elevation: 10.0,
          ),
          backgroundColor: Colors.blueGrey,
          body: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot item = snapshot.data!.docs[index];
              return Container(
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                  ),
                  child: Text(
                      "Ligue Régionale ${item['region'] as String}",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
              );
            },
            padding: const EdgeInsets.all(25),
          ),
        );
      },
    );
  }
}

