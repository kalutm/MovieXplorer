# Movie-Xplorer

Movie-Xplorer is a Flutter application that allows users to search and discover movies using the TMDB API. Enjoy a clean, responsive interface with options to search by movie title or filter movies by genre, language, release year, and minimum rating.

---

## Features

- **Search by Title:**  
  Quickly find movies by entering a movie name.

- **Advanced Filtering:**  
  Filter movies based on genre, language, release year, and minimum rating.

- **Responsive UI:**  
  Custom layouts with larger movie images and detailed information.

- **Robust Error Handling:**  
  Comprehensive error handling for network issues, timeouts, and missing data (with fallback images).

- **TMDB Integration:**  
  Retrieves movie data using the TMDB API.  
  **Note:** This app is not endorsed by TMDB.

- **Detailed Movie View:**  
  The detailed results screen is fully implemented, providing complete movie details.

---

## Getting the App

### For Most Users (Download the APK)

A pre-built release APK is available for Android devices. Download and install the APK directly without needing to run the app from your computer.

- **Download Location:**  
  `build/app/outputs/flutter-apk/app-release.apk`

Transfer the APK file to your Android device and install it (ensure that installation from unknown sources is enabled in your device settings).

---

### For Developers or Those Who Wish to Build from Source

If you prefer to run or modify the source code, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/kalutm/Movie-Xplorer.git
   cd Movie-Xplorer
## Install Dependencies

Run the following command in your project directory:

```bash
flutter pub get
Pass the API Key via Environment Variable
Instead of using a .env file, pass your TMDB API key via dart-define. Replace your_api_key_here with your actual API key.

To run the app:

bash
Copy
Edit
flutter run --dart-define=API_KEY=your_api_key_here
To build the release APK:

bash
Copy
Edit
flutter build apk --dart-define=API_KEY=your_api_key_here
Configure Assets
Ensure that your pubspec.yaml file includes the asset directory (e.g., the logo image):

yaml
Copy
Edit
flutter:
  assets:
    - assets/icon/logo2.jpg
Run the App
Connect your device or start an emulator, then run the app using the dart-define command shown above.

Project Structure
lib/
main.dart: App entry point.
screens/
welcome.dart: Splash screen displayed at startup.
home/home.dart: Home screen with search options.
home/search.dart: Screen for searching movies by title.
home/search_by_type.dart: Screen for filtering movies by type.
results.dart: Displays movie search results.
detailed_results.dart: Shows detailed movie information.
about.dart: Information about the app and the developer.
datas/
movie_class.dart: Movie model and JSON parsing.
language_codes.dart: Map of language codes to full names.
drop_down_items.dart: Data for dropdown menus (genres, languages, years, ratings).
service/
api_requests.dart: API request methods and image fetching.
genre_id_to_string.dart: Utility to convert genre IDs to human-readable strings.
Dependencies
http
font_awesome_flutter
flutter_spinkit
url_launcher
Note: The API key is passed via dart-define (use --dart-define=API_KEY=your_api_key_here).

Credits
Developed by Kaleb Tesfahun

This project uses the TMDB API but is not endorsed, certified, or otherwise approved by TMDB.

Enjoy exploring movies with Movie-Xplorer!
