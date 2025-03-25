import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app1/consts.dart';

import 'all_movies_page.dart';
import 'home_page_cinema.dart';
import 'profile_page.dart';
import 'tickets_page.dart';

class CinemaMainScreen extends StatefulWidget {
  const CinemaMainScreen({super.key});

  @override
  State<CinemaMainScreen> createState() => _CinemaMainScreenState();
}

class _CinemaMainScreenState extends State<CinemaMainScreen> {
  List<IconData> bottomIcons = [
    Icons.home_filled,
    Icons.movie_outlined,
    CupertinoIcons.ticket_fill,
    Icons.person_rounded
  ];

  int currentIndex = 0;
  late final List<Widget> page;
  
  @override
  void initState() {
    super.initState();
    page = [ 
      const HomePageCinema(),
      const AllMoviesPage(),
      const TicketsPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            bottomIcons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300), // Thêm const
                    height: currentIndex == index ? 25 : 0,
                    width: currentIndex == index ? 25 : 0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFffb43b).withOpacity(0.2), // Thêm const
                          spreadRadius: currentIndex == index ? 10 : 0,
                          blurRadius: currentIndex == index ? 15 : 0,
                        )
                      ],
                    ),
                  ),
                  Icon(
                    bottomIcons[index],
                    color: currentIndex == index
                        ? const Color(0xFFffb43b) // Thêm const
                        : Colors.white.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: page[currentIndex],
    );
  }

  Widget navBarPage(IconData iconName) { // Thêm kiểu trả về Widget và đổi tên tham số
    return Center(
      child: Icon(
        iconName,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
