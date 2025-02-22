import 'package:flutter/material.dart';
import 'package:x_movie/datas/movie_class.dart';
import 'package:x_movie/screens/results.dart';
import 'package:x_movie/service/api_requests.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch() {
    if (_searchController.text.trim().isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        // Fetching three pages of results
        Future<List<Movie>> page1 = ApiResponse.getMovieBySearch(
          ApiResponse(query: _searchController.text, genre: '', language: '', year: '', minRating: ''),
          1,
        );
        Future<List<Movie>> page2 = ApiResponse.getMovieBySearch(
          ApiResponse(query: _searchController.text, genre: '', language: '', year: '', minRating: ''),
          2,
        );
        Future<List<Movie>> page3 = ApiResponse.getMovieBySearch(
          ApiResponse(query: _searchController.text, genre: '', language: '', year: '', minRating: ''),
          3,
        );
        return Results(movies: ApiResponse.getAll(page1, page2, page3));
      }),
    ).then((_) {
      _searchController.clear();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: 'Enter a Movie Name',
        hintStyle: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.grey.shade800,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          onPressed: _performSearch,
          icon: const Icon(Icons.search),
          color: Color(0xfff5f5f5),
        ),
      ),
      onSubmitted: (value) => _performSearch(),
    );
  }
}
