import 'package:flutter/material.dart';
import 'package:x_movie/datas/movie_class.dart';
import 'package:x_movie/screens/detailed_results.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:x_movie/service/api_requests.dart';

class Results extends StatelessWidget {
   final Future<List<Movie>> movies;
  const Results({required this.movies, super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text(
          "Movies",
          style: TextStyle(
            color: Color(0xfff5f5f5)
          )
        )
      ),
      // Using FutureBuilder to check the state of the Future and show the appropraite figures
      body: FutureBuilder(
        future: movies,
         builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the connection is waiting, show a loading icon
            return Center(child:SpinKitRotatingCircle(
                    color: Color(0xfff5f5f5),
                    size: 50.0,
                  )
                );
          } else if (snapshot.hasError) {
            // If there was an error, display it on the UI
            return Center(child: Text("Error: ${snapshot.error.toString()}", style: TextStyle(color: Color(0xfff5f5f5))));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If data is empty, show a message on the UI
            return Center(child: Text("No movies found.", style: TextStyle(color: Color(0xfff5f5f5))));
          } else{
            // If the data(Future) was fetched successfully then display it on demand using ListView
            final List<Movie> movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 12,
                  margin: EdgeInsets.all(10),
                  color: Colors.black,
                  // ListTiles to show the Image and Title side by side
                  child: ListTile(
                    leading: ApiResponse.getImage(movies[index].posterPath),
                    subtitle: Text(
                      movies[index].releaseDate,
                      style: TextStyle(
                        color: Colors.grey[100]
                      )
                      ),
                    title: Text(
                      movies[index].title,
                      style: TextStyle(
                        color: Color(0xfff5f5f5),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Navigate to the detailed results screen with the selected movie data
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return DetailedResults(movie: movies[index]);
                        })
                      );
                    },
                )
              );
            }
          );
        }
      }
     )
    );
  }
}