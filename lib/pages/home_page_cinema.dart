import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app1/consts.dart';
import 'package:test_app1/models/category_model.dart';
import 'package:test_app1/pages/detail_page.dart';

import '../models/movie_model.dart';

class HomePageCinema extends StatefulWidget {
  const HomePageCinema({super.key});

  @override
  State<HomePageCinema> createState() => _HomePageCinemaState();
}

class _HomePageCinemaState extends State<HomePageCinema> {
  late PageController controller;
  double pageoffSet = 1;
  int currentIndex = 1;
  int selectedTabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  final List<String> _tabs = ["Now Showing", "Coming Soon", "Top Rated"];
  
  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 1,
      viewportFraction: 0.6,
    )..addListener(() {
        setState(() {
          pageoffSet = controller.page!;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: appBackgroundColor,
      appBar: headerParts(),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildFeaturedMovie(),
            const SizedBox(height: 35),
            searchField(),
            const SizedBox(height: 30),
            _buildTabs(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 13,
                              color: buttonColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: buttonColor,
                            size: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 17),
                  categoryItems(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Container(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Showing this month",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView.builder(
                          controller: controller,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index % movies.length;
                            });
                          },
                          itemBuilder: (context, index) {
                            double scale = max(
                              0.6,
                              (1 - (pageoffSet - index).abs() + 0.6),
                            );
                            double angle = (controller.position.haveDimensions
                                    ? index.toDouble() - (controller.page ?? 0)
                                    : index.toDouble() - 1) *
                                5;
                            angle = angle.clamp(-5, 5);
                            final movie = movies[index % movies.length];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MovieDetailPage(movie: movie),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 100 - (scale / 1.6 * 100),
                                ),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Transform.rotate(
                                      angle: angle * pi / 90,
                                      child: Hero(
                                        tag: movie.poster,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: Image.network(
                                            movie.poster,
                                            height: 300,
                                            width: 205,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                            top: 330,
                            child: Row(
                              children: List.generate(
                                movies.length,
                                (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(right: 15),
                                  width: currentIndex == index ? 30 : 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? buttonColor
                                        : Colors.white24,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildRecommendedMovies(),
            const SizedBox(height: 20),
            _buildUpcomingReleases(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: appBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/cinema/ff1.jpg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Be_soi Cinema',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Enjoy your movie experience',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home'),
          _buildDrawerItem(Icons.movie, 'Movies'),
          _buildDrawerItem(Icons.event_seat, 'My Tickets'),
          _buildDrawerItem(Icons.favorite, 'Favorites'),
          _buildDrawerItem(Icons.notifications, 'Notifications'),
          const Divider(color: Colors.white24),
          _buildDrawerItem(Icons.settings, 'Settings'),
          _buildDrawerItem(Icons.help, 'Help & Support'),
          _buildDrawerItem(Icons.logout, 'Sign Out'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        // Add navigation logic here if needed
      },
    );
  }

  Widget _buildFeaturedMovie() {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/cinema/INTERSTELLAR.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'FEATURED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'INTERSTELLAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 5),
                    const Text(
                      '9.1/10',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Text(
                        '2025',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 15,
            bottom: 15,
            child: CircleAvatar(
              backgroundColor: buttonColor,
              radius: 20,
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            _tabs.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: selectedTabIndex == index
                      ? buttonColor
                      : Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: selectedTabIndex == index
                        ? Colors.white
                        : Colors.white70,
                    fontWeight: selectedTabIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedMovies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recommended for you",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 180,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              final movie = movies[index % movies.length];
              return Container(
                width: 130,
                margin: const EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        movie.poster,
                        height: 120,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.title.length > 15
                          ? '${movie.title.substring(0, 15)}...'
                          : movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          '${movie.rating}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingReleases() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Coming Soon",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              final movie = upcomingMovies[(index + 3) % movies.length];
              return Container(
                width: 270,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.network(
                        movie.poster,
                        height: 120,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              movie.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              movie.genre,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: buttonColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:  Text(
                                movie.releaseDate,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Row categoryItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        categories.length,
        (index) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white10.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                categories[index].emoji,
                fit: BoxFit.cover,
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              categories[index].name,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 19),
          filled: true,
          fillColor: Colors.white.withOpacity(0.05),
          hintText: "Search",
          hintStyle: const TextStyle(
            color: Colors.white54,
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 35,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      backgroundColor: appBackgroundColor,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      centerTitle: true,
      title: const Text(
        "Be_soi Cinema",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage (
                "assets/cinema/ff1.jpg",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
