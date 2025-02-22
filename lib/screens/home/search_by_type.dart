import 'package:flutter/material.dart';
import 'package:x_movie/datas/movie_class.dart';
import 'package:x_movie/screens/results.dart';
import 'package:x_movie/datas/drop_down_items.dart' show genreOptions, languageOptions, yearOptions, ratingOptions;
import 'package:x_movie/service/api_requests.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SearchByType extends StatefulWidget {
  const SearchByType({Key? key}) : super(key: key);

  @override
  State<SearchByType> createState() => _SearchByTypeState();
}

class _SearchByTypeState extends State<SearchByType> {
  String selectedGenre = "";
  String selectedLanguage = "";
  String selectedYear = "";
  String selectedMinRating = "";

  void _searchByType() {
    Map<String, String> input = {
      "query": "",
      "genre": genreOptions[selectedGenre] ?? "",
      "language": languageOptions[selectedLanguage] ?? "",
      "year": selectedYear,
      "minRating": selectedMinRating,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          Future<List<Movie>> page1 = ApiResponse.getMovieBySearchType(ApiResponse.formType(input), 1);
          Future<List<Movie>> page2 = ApiResponse.getMovieBySearchType(ApiResponse.formType(input), 2);
          Future<List<Movie>> page3 = ApiResponse.getMovieBySearchType(ApiResponse.formType(input), 3);
          return Results(movies: ApiResponse.getAll(page1, page2, page3));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Genre Dropdown
            DropdownButtonFormField<String>(
              value: selectedGenre.isEmpty ? null : selectedGenre,
              style: const TextStyle(color: Color(0xfff5f5f5),fontWeight: FontWeight.bold,fontSize: 18),
              dropdownColor: Colors.grey.shade900,
              decoration: InputDecoration(
                labelText: "Select Genre",
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.movie, color: Color(0xfff5f5f5)),
              ),
              items: genreOptions.keys.map((String genre) {
                return DropdownMenuItem<String>(
                  value: genre,
                  child: Text(genre),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGenre = value ?? "";
                });
              },
            ),
            const SizedBox(height: 12),
            // Language Dropdown
            DropdownButtonFormField<String>(
              value: selectedLanguage.isEmpty ? null : selectedLanguage,
              style: const TextStyle(color: Color(0xfff5f5f5),fontWeight: FontWeight.bold,fontSize: 18),
              dropdownColor: Colors.grey.shade900,
              decoration: InputDecoration(
                labelText: "Select Language",
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.language, color: Color(0xfff5f5f5)),
              ),
              items: languageOptions.keys.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value ?? "";
                });
              },
            ),
            const SizedBox(height: 12),
            // Year Dropdown
            DropdownButtonFormField<String>(
              value: selectedYear.isEmpty ? null : selectedYear,
              style: const TextStyle(color: Color(0xfff5f5f5),fontWeight: FontWeight.bold,fontSize: 18),
              dropdownColor: Colors.grey.shade900,
              decoration: InputDecoration(
                labelText: "Select Year",
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.date_range, color: Color(0xfff5f5f5)),
              ),
              items: yearOptions.map((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedYear = value ?? "";
                });
              },
            ),
            const SizedBox(height: 12),
            // Minimum Rating Dropdown
            DropdownButtonFormField<String>(
              value: selectedMinRating.isEmpty ? null : selectedMinRating,
              style: const TextStyle(color: Color(0xfff5f5f5),fontWeight: FontWeight.bold,fontSize: 18),
              dropdownColor: Colors.grey.shade900,
              decoration: InputDecoration(
                labelText: "Select Minimum Rating",
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(FontAwesomeIcons.rankingStar, color: Color(0xfff5f5f5)),
              ),
              items: ratingOptions.map((String rating) {
                return DropdownMenuItem<String>(
                  value: rating,
                  child: Text(rating),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMinRating = value ?? "";
                });
              },
            ),
            const SizedBox(height: 20),
            // Search Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _searchByType,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
              
                ),
                child: const Text(
                  'Search',
                  style: TextStyle(color: Color(0xfff5f5f5),fontWeight: FontWeight.bold,fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
