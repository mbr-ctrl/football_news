import 'package:flutter/material.dart';
import 'splash.dart';
import 'list_page.dart';
import 'package:football_news/widgets/category_section.dart';
import 'list_page.dart';
import 'players_by_club.dart';
import 'list_clubs.dart';
import 'news.dart';
import 'match_results.dart';
import 'add_club.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /* void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
    });

    super.initState();
  }
   */

  int _selectedTab = 0;
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
  final List _screens = [
    {
      "screen": HomePage(),
      "title" : "Accueil"
    },
    {
      "screen": ListClubs(),
      "title" : "Clubs"
    },
    {
      "screen": ResultsMatch(),
      "title" : "Resultats des Matchs"
    },
    {
      "screen": News(),
      "title" : "Actualité"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedTab]['title']),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const AddClub();
                      },
                      fullscreenDialog: true
                  )
              );
            },
            icon: const Icon(Icons.add)
        ),
      ),
      body: _screens[_selectedTab]['screen'],
      bottomNavigationBar: Container(
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10
                )
              ]
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            ),
            child: BottomNavigationBar(
              selectedItemColor: Color(0xFF5F67EA),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              unselectedItemColor: Colors.grey.withOpacity(0.7),
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedTab,
              onTap: _changeTab,
              items: [
                BottomNavigationBarItem(
                    label: _screens[0]['title'],
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(
                        Icons.home_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                ),
                BottomNavigationBarItem(
                    label: _screens[1]['title'],
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                ),
                BottomNavigationBarItem(
                    label: _screens[2]['title'],
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                ),
                BottomNavigationBarItem(
                    label: _screens[3]['title'],
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(
                        Icons.receipt_long_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F67EA),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CategorySection()
          ],
        )
      ),
    );
  }
}



