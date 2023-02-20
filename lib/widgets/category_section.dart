import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CategorySection extends StatefulWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {

  List categories = [];
  Future<List> fetchClubs() async {
    final _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot clubs = await _firestoreInstance.collection("club").get();
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
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.all(25),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Column(
                  children: [
                    Container(
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                    ),
                      child: Image.network(
                        categories[index]['logo']
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                        categories[index]['nom'] as String,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    )
                  ],
                ),
              separatorBuilder: (_, index) => const SizedBox(width: 33), itemCount: categories.length),
        ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: 410,
            child: const Text(
              'Actualités',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ]
      )
    );
  }
}
