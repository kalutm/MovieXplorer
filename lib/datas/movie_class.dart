import 'package:x_movie/service/genre_id_to_string.dart' show genreIdToString;
import 'package:x_movie/datas/language_codes.dart' show languageCodes;

// Custom movie class to store and encapsulate movie data in one variable
class Movie{

  String title;
  String language;
  double rating;
  bool adult;
  String releaseDate;
  String description;
  String posterPath;
  String genre;
  double id;

  Movie({required this.title, required this.language, required this.rating, required this.adult, required this.releaseDate, required this.description, required this.posterPath, required this.genre, required this.id});



//parsing a movie frm json
factory Movie.fromJson(Map<String, dynamic> json) {

  String releaseDate = "Unknown";
  if (json["release_date"] is String && (json["release_date"] as String).length >= 4) {
    releaseDate = (json["release_date"] as String).substring(0, 4);
  }




  return Movie(
    title: json["title"] ?? "Unknown",
    language: languageCodes[json["original_language"]] ?? "Unknown",
    rating: (json["vote_average"] ?? 0).toDouble(),
    adult: json["adult"] ?? false,
    releaseDate: releaseDate,
    description: json["overview"] ?? "No description available.",
    posterPath: json["poster_path"] ?? "",
    genre: genreIdToString(List<int>.from(json["genre_ids"] ?? [])).isEmpty ? "Unknown": genreIdToString(List<int>.from(json["genre_ids"] ?? [])),
    id: json["id"].toDouble()
  );
}
}
