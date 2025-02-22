import 'package:flutter/material.dart';
import 'package:x_movie/screens/about.dart';
import 'package:x_movie/screens/home/search.dart';
import 'package:x_movie/screens/home/search_by_type.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
  
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xfff5f5f5)),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color(0xfff5f5f5),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
        elevation: 5,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade800),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xfff5f5f5),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xfff5f5f5)),
              title: const Text('Home', style: TextStyle(color: Color(0xfff5f5f5), fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.circleInfo, color: Color(0xfff5f5f5)),
              title: const Text('About', style: TextStyle(color: Color(0xfff5f5f5), fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            // Discover Movies Section
            Text(
              'Discover Movies',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Color(0xfff5f5f5),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              color: Colors.grey.shade800,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Search(),
              ),
            ),
            const SizedBox(height: 20),
            // Filter Movies Section
            Text(
              'Filter Movies',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Color(0xfff5f5f5),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Card(
                color: Colors.grey.shade800,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const SearchByType(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
