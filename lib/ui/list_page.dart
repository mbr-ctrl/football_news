import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:football_news/services/firestore_service.dart";
import 'players_by_club.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: ListPage(),
    );
  }
}


class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);


  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final Stream<QuerySnapshot> _collection = ApiConnect.getData();


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _collection,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Loading"),
          );
        }

        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> club =
            document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: (() =>
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return GetPlayersByClub(documentID: document.id);
                      })
                  )
                }
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Image.network(club['logo']),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              club['nom'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),

                            Text(club['ville'].toString()),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
