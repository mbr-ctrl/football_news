import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_news/services/firestore_service.dart';
import 'players_by_club.dart';
import 'detail_club.dart';

class ListClubs extends StatefulWidget {
  const ListClubs({Key? key}) : super(key: key);

  @override
  State<ListClubs> createState() => _ListClubsState();
}

class _ListClubsState extends State<ListClubs> {
  final Stream<QuerySnapshot> _clubs = ApiConnect.getData();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _clubs,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text(("Loading..."))
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot item = snapshot.data!.docs[index];
            return Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: (() =>
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return GetPlayersByClub(documentID: item.id);
                        })

                    )
                  }
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Image.network(item['logo']),
                      ),
                     const SizedBox(width: 30),
                     Expanded(
                         child:  Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 item['nom'],
                                 style: const TextStyle(
                                     fontSize: 18, fontWeight: FontWeight.bold
                                 ),
                               ),
                               Text("Ville: ${item['ville']}")
                             ],
                           ),
                         )
                     )
                    ],
                  ),
                )
            );
          },

        );

      },
    );
  }
}
