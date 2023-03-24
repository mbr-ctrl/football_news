import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:football_news/ui/ligue_regionale.dart';

class ShowCases extends StatefulWidget {
  const ShowCases({Key? key}) : super(key: key);

  @override
  State<ShowCases> createState() => _ShowCasesState();
}


class _ShowCasesState extends State<ShowCases> {

  List categories = [];
  Future<List> fetchClubs() async {
    final _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot clubs = await _firestoreInstance.collection("populair").get();
    final allData = clubs.docs.map((doc) => doc.data()).toList();
    return allData;
  }
  @override
  void initState() {
    setState(() {
      fetchClubs().then((List list) {
        setState(() {
          categories = list;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            height: 50,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: const TextStyle(fontSize: 25),
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  child: const Text('Elite One'),
                  onPressed: () {
                    debugPrint('Code de mon bouton');
                  },
                ),
                const SizedBox(width: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: const TextStyle(fontSize: 25),
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  child: const Text('Elite Two'),
                  onPressed: () {
                    debugPrint('Code de mon bouton');
                  },
                ),
                const SizedBox(width: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: const TextStyle(fontSize: 25),
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  child: const Text('Régionale'),
                  onPressed: () {
                    Navigator.push(
                        context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const RegionalLeagues();
                      })
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          Container(
            height: 200,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
            ),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    width: 200.0,
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              categories[index]['image'],
                          ),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ),
                ),
                  ),
                ),
                separatorBuilder: (_, index) => const SizedBox(width: 33), itemCount: categories.length),
          ),
        ],
      ),
    );
  }
}
