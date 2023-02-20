import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailClub extends StatefulWidget {
  final DocumentSnapshot team;
  const DetailClub({Key? key, required this.team}) : super(key: key);

  @override
  State<DetailClub> createState() => _DetailClubState();
}

class _DetailClubState extends State<DetailClub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.team['nom'],
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: widget.team
                  ['logo'],
                  child: Material(
                    color: Colors.transparent,
                    child: Image.network(
                      widget.team['logo'],
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: Text(
                  "Nom du club: ${widget.team['nom']}",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Text(
                  "Ville: ${widget.team['ville']}",
                  style: const TextStyle(
                      fontSize: 18
                  ),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
      )
    );
  }
}
