import 'package:flutter/material.dart';

class ResultsMatch extends StatefulWidget {
  const ResultsMatch({Key? key}) : super(key: key);

  @override
  State<ResultsMatch> createState() => _ResultsMatchState();
}

class _ResultsMatchState extends State<ResultsMatch> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Text("Résultat des matchs"),
      ),
    );
  }
}
