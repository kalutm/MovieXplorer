import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:x_movie/datas/movie_class.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

// Custom ApiResponse class to encapsulate all Api request varables and methods
class ApiResponse {
    String query;
    String genre;
    String language;
    String year;
    String minRating= "5";

  ApiResponse({required this.query, required this.genre, required this.language, required this.year, required this.minRating});
// Fetching image from relative url(poster path)
static Widget getImage(String posterPath){
  
  // Return an image only if the poster patah isn't empty
  return (posterPath.isNotEmpty) ?
      Container(
        width: 100,
        height: 150,
        child: Image.network(
        'https://image.tmdb.org/t/p/w500$posterPath' ,
         fit: BoxFit.cover,
         // If there is an error fetching the movie return a movie image
         errorBuilder:(context, error, stackTrace) => Image.network(
          "https://w7.pngwing.com/pngs/776/932/png-transparent-short-film-corner-graphy-filmstrip-smiley-music-video-black-thumbnail.png",
          fit: BoxFit.cover
          ),
        ),
      ):
      // If the poster path is empty return a broken image instead
       Container(
        width: 100,
        height: 150,
        color: Colors.grey,
        child: const Icon(Icons.broken_image, size: 50));
}

// Custom method for fetching movies with query parameters
static Future<List<Movie>> getMovieBySearch(ApiResponse input, int page) async {
  // Using try catch block to display any error if found
  try {
  // Using environment varables to hide the Private ApiKey
  const String apiKey = String.fromEnvironment('API_KEY', defaultValue: 'default_value');

    final String query = input.query;
    final Uri url = Uri.parse(
      'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query&page=$page'
    );

    // Adding a timeout to handle network delays
    final Response response = await get(url).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        throw TimeoutException("The connection has timed out, please try again.");
      },
    );
    // Proceed with the result only if the fetching was successful
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];

      List<Movie> movies = results
          .map((item) => Movie.fromJson(item as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      // Include more detailed error information if available
      throw Exception("Failed to load movies: ${response.reasonPhrase}");
    }
  } on TimeoutException catch (e) {
    throw Exception("Request timed out. Please try again later. Details: $e");
    // Catching and displaying any dynamic errors if found
  } catch (e) {
    print("Error occurred: $e");
    throw Exception("An unexpected error occurred. Please try again later.");
  }
}


// Custom method for filtering movies with genre, language, releaseYear and minimum rating
static Future<List<Movie>> getMovieBySearchType(ApiResponse input, int page) async {
  // Using try catch block to display any error if found
  try {
    final String genre = input.genre;
    final String language = input.language;
    final String year = input.year;
    final String minRating = input.minRating;
    // Using environment varables to hide the Private ApiKey
    const String apiKey = String.fromEnvironment('API_KEY', defaultValue: 'default_value');

    final Uri url = Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genre&with_original_language=$language&primary_release_year=$year&vote_average.gte=$minRating&page=$page'
    );

    // Adding a timeout to handle network delays
    final Response response = await get(url).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        throw TimeoutException("The connection has timed out, please try again.");
      },
    );
    // Proceed with the result only if the fetching was successful
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];

      List<Movie> movies = results
          .map((item) => Movie.fromJson(item as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      // Include more detailed error information if available
      throw Exception("Failed to load movies: ${response.reasonPhrase}");
    }
  } on TimeoutException catch (e) {
    throw Exception("Request timed out. Please try again later. Details: $e");
    
  }
  // Catching and displaying any dynamic errors if found
   catch (e) {
    print("Error occurred: $e");
    throw Exception("An unexpected error occurred. Please try again later.");
  }
}

// Parsing an ApiResponse from the selected filter types
factory ApiResponse.formType(Map<String, dynamic> type){
     ApiResponse choosed = ApiResponse(
      query: "",
       genre: type["genre"] ?? "",
       language: type["language"] ?? "",
       year: type["year"],
        minRating: type["minRating"]
      );
      return choosed;
}

// Using Future.wait to wait until all(3) Future<List<Movie>>'s complete
static Future<List<Movie>> getAll(Future<List<Movie>> page1, Future<List<Movie>> page2, Future<List<Movie>> page3) async{
  final results = await Future.wait([
    page1, page2, page3

  ]);
  // Combining the Future<List<Movie>>'s in To one Future<List<Movie>>
  return results.expand((list) => list).toList();
}

// launching gmail app 
static void launchEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto', // Make sure to include this
    path: 'kalebtesfahun@gmail.com', // The email address
    queryParameters: {
      'subject': '',
      'body': ''
    },
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    print('Could not launch email app');
  }
}

// Custom method to get youTube video key(relative youtube url) to display a video on the trailer screen, using youtube_player_flutter
static Future<String> getVideoKey(double id)async{
    // Using try catch block to display any error if found
    try{

      // Using environment varables to hide the Private ApiKey
      const String apiKey = String.fromEnvironment('API_KEY', defaultValue: 'default_value');
      Uri url = Uri.parse('https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey');
      Response response = await get(url);
      // Proceed with the result only if the fetching was successful
      if(response.statusCode == 200){

        final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic>videos = body["results"];
       // If there is no trailer data return an empty string
       if(videos.isEmpty){
        return "";
       }
      // Finding the youTube Trailer from the Trailers provided
       else{
        final trailer = videos.firstWhere((video) => video["type"] == "Trailer", orElse: () => <String, dynamic>{});
        return trailer?["key"] ?? "";
       }

      }
      // Include more detailed error information if available
      else{
        throw Exception("Failed to load trailer: ${response.reasonPhrase}");
      }
    
    }
    // return an empty string if any error was catched
    catch(e){
      print("Error fetching video key: $e"); 
      return "";
    }

}



}