import 'package:flutter/material.dart';
import 'package:test_app1/Widget/movie_info.dart';
import 'package:test_app1/consts.dart';
import 'package:test_app1/models/movie_model.dart';
import 'package:test_app1/pages/reservation_screen.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Movie Detail",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: 335,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: movie.poster,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          movie.poster,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MovieInfo(
                          icon: Icons.videocam_rounded,
                          name: "Genera",
                          value: movie.genre,
                        ),
                        MovieInfo(
                          icon: Icons.timer,
                          name: "Duration",
                          value: formatTime(
                            Duration(minutes: movie.duration),
                          ),
                        ),
                        MovieInfo(
                          icon: Icons.star,
                          name: "Rating",
                          value: "${movie.rating}/10",
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: buttonColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Synopsis",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  movie.synopsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.8,
                  ),
                ),
              ),
              const SizedBox(height: 80), // Add space for the floating button
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff1c1c27),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ReservationScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Get Reservation",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
