# MovieXplorer

MovieXplorer is a Flutter application that allows users to search and explore movies using the TMDB API. The app provides features such as searching by movie title, filtering by genre, language, release year, and rating, as well as detailed movie information and trailer playback.

---

## Repository

You can view the complete source code at:
[https://github.com/kalutm/MovieXplorer.git](https://github.com/kalutm/MovieXplorer.git)

---

## Android Release (Pre-built APK)

A pre-built release APK for Android devices is available here:

[build/app/outputs/flutter-apk/app-release.apk](https://github.com/kalutm/MovieXplorer/tree/main/build/app/outputs/flutter-apk)

**Installation:**

1. Download the APK file.
2. Enable "Install from unknown sources" on your Android device.
3. Install the APK.

---

## Features

-   **Search and Discovery:** Search for movies by title or filter by genre, language, release year, and minimum rating.
-   **Detailed Movie Information:** Get comprehensive details about each movie.
-   **Trailer Playback:** Watch movie trailers with integrated YouTube playback.
-   **Responsive UI:** Enjoy a clean and responsive interface built with Flutter.

---

## Getting Started (Local Development)

If you wish to run or modify the project locally, follow these steps:

1.  **Clone the Repository:**

    ```bash
    git clone [https://github.com/kalutm/MovieXplorer.git](https://github.com/kalutm/MovieXplorer.git)
    cd MovieXplorer
    ```

2.  **Install Dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Pass the TMDB API Key:**

    Instead of using a `.env` file, pass your TMDB API key using `dart-define`. Replace `your_api_key_here` with your actual TMDB API key.

    **Run the App:**

    ```bash
    flutter run --dart-define=API_KEY=your_api_key_here
    ```

    **Build the Release APK:**

    ```bash
    flutter build apk --dart-define=API_KEY=your_api_key_here
    ```

4.  **Configure Assets:**

    Ensure that your assets (e.g., logo images) are properly declared in your `pubspec.yaml` file.

---

## Project Structure

lib/
├── main.dart: App entry point.
├── screens/
│   ├── welcome.dart: Splash screen displayed at startup.
│   ├── home/
│   │   ├── home.dart: Home screen with search options.
│   │   ├── search.dart: Screen for searching movies by title.
│   │   └── search_by_type.dart: Screen for filtering movies by type.
│   ├── results.dart: Displays movie search results.
│   ├── detailed_results.dart: Shows detailed movie information.
│   └── about.dart: Information about the app and the developer.
├── datas/
│   ├── movie_class.dart: Movie model and JSON parsing.
│   ├── language_codes.dart: Map of language codes to full names.
│   └── drop_down_items.dart: Data for dropdown menus (genres, languages, years, ratings).
└── service/
├── api_requests.dart: API request methods and image fetching.
└── genre_id_to_string.dart: Utility to convert genre ID.


---

## Dependencies

http: ^1.3.0
flutter_dotenv: ^5.0.2
url_launcher: ^6.1.10
flutter_spinkit: ^5.2.1
font_awesome_flutter: ^10.1.0
youtube_player_flutter: ^9.1.1


---

## Credits

Developed by Kaleb Tesfahun

**Note:** This project uses the [TMDB API](https://www.themoviedb.org/) but is not endorsed, certified, or otherwise approved by TMDB.

Enjoy exploring movies with MovieXplorer!
