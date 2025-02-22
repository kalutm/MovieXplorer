import 'package:flutter/material.dart';
import 'package:x_movie/datas/movie_class.dart';
import 'package:x_movie/screens/trailer_screen.dart';
import 'package:x_movie/service/api_requests.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Showing movie details
class DetailedResults extends StatelessWidget {
  final Movie movie;
  const DetailedResults({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: Text("Overview", style: TextStyle(color: Colors.white))),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title,
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xfff5f5f5),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Divider(color: Colors.grey),
            Container(
                height: 300,
                width: 350,
                child: ApiResponse.getImage(movie.posterPath)),
            SizedBox(height: 20),
            Divider(color: Colors.grey),
            Text("Description :",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xfff5f5f5),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Divider(color: Colors.grey),
            // Validating data before using
            Text(
                movie.description.isEmpty
                    ? "No description available."
                    : movie.description,
                style: TextStyle(color: Color(0xfff5f5f5))),
            SizedBox(height: 5),
            Divider(color: Colors.grey),
            Text("Language: ${movie.language}",
                style: TextStyle(color: Color(0xfff5f5f5))),
            SizedBox(height: 5),
            Divider(color: Colors.grey),
            Text("Rating: ${movie.rating}",
                style: TextStyle(color: Color(0xfff5f5f5))),
            SizedBox(height: 5),
            Divider(color: Colors.grey),
            Text("Release Date: ${movie.releaseDate}",
                style: TextStyle(color: Color(0xfff5f5f5))),
            SizedBox(height: 5),
            Divider(color: Colors.grey),
            Text("Genre: ${movie.genre}",
                style: TextStyle(color: Color(0xfff5f5f5))),
            Divider(color: Colors.grey),
            SizedBox(height: 10),
            // Used Future builder to know the state of the Future before building
            FutureBuilder<String>(
              future: ApiResponse.getVideoKey(movie.id),
              builder: (context, snapshot) {
                // Displaying loading icon while Future gets ready
                if (snapshot.connectionState == ConnectionState.waiting) {
                 return Center(child: SpinKitRotatingCircle(
                    color: Color(0xfff5f5f5),
                    size: 50.0,
                    ));
                }
                // Validating data before using
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("Trailer not available", style: TextStyle(color: Color(0xfff5f5f5))));
                }
                // Navigation to Trailer screen when tapped with the video key
                String videoKey = snapshot.data!;
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrailerScreen(videoKey: videoKey),
                    ),
                  ),
                  //Using stack to overlay the text, icon and the image below
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // YouTube thumbnail with rounded corners
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://img.youtube.com/vi/$videoKey/0.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Semi-transparent overlay with the play icon and hint text
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black45,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_circle_fill,
                                  color: Colors.white, size: 40),
                              SizedBox(width: 8),
                              Text("Watch Trailer",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
