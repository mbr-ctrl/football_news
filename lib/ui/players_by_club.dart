import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_news/services/firestore_service.dart';
import 'add_player.dart';


class GetPlayersByClub extends StatelessWidget {
  final String documentID;
  const GetPlayersByClub({Key? key, required this.documentID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des joueurs"),
        /*actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return AddPlayerByClub(documentID: documentID);
                    },
                    fullscreenDialog: true
                  )
                );
            },
              icon: Icon(Icons.add)
          )
        ],*/
      ),
      body: GetPlayers(docID: documentID)
    );
  }
}


class GetPlayers extends StatefulWidget {
  final String docID;
  GetPlayers({Key? key, required this.docID}) : super(key: key);

  @override
  State<GetPlayers> createState() => _GetPlayersState();
}

class _GetPlayersState extends State<GetPlayers> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _collection = ApiConnect().getPlayersByclub(widget.docID);
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
            Map<String, dynamic> player =
            document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.network(player['image']),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            player['nom'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),

                          Text(player['position'].toString()),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

