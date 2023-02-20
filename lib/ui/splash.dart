import 'dart:async';
import 'package:flutter/material.dart';
import 'package:football_news/ui/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delay_animation.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: Container(
                  height: 200,
                  child: Image.asset('assets/lpfc.png'),
                ),
              ),
              
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "Ligue professionnelle de football".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 1500,
                child: Container(
                  height: 190,
                  child: Image.asset('assets/ballon.png'),
                ),
              ),
              DelayedAnimation(
                delay: 4500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(13)),
                    child: const Text('GET STARTED'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 65),
              DelayedAnimation(
                delay: 2500,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "powered by".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(width: 25),
                      Container(
                        height: 40,
                        child: Image.asset(
                          "assets/NGT.png",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
