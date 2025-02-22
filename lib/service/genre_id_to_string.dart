// Function to get the corresponding english word for the corresponding int value of genre
String genreIdToString(List<int> genreIds){
  // Mapping of genre int's in to genre string's provided by TMDB
  Map<int, String> genreOptions = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western",
};

    String convertedGenre = '';
    for(int ids in genreIds){
     convertedGenre += " ${genreOptions[ids]}, ";
    }
    return convertedGenre;
}