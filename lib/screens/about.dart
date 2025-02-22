import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_movie/service/api_requests.dart';

class AboutPage extends StatelessWidget {

   const AboutPage({super.key});
   void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "About Movie Xplorer",
          style: TextStyle(
            color: Color(0xfff5f5f5)
          )
          ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Logo & Name
              Center(
                child: Column(
                  children: [
                    Icon(Icons.movie, size: 60, color: Color(0xfff5f5f5)),
                    SizedBox(height: 10),
                    Text(
                      "Movie Xplorer",
                      style: TextStyle(fontSize: 24,color: Color(0xfff5f5f5), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
        
              // App Purpose
              Text(
                "Movie Xplorer allows users to search and discover movies, view details, and explore top-rated films using the TMDB API.",
                style: TextStyle(fontSize: 16, color: Color(0xfff5f5f5)),
              ),
              SizedBox(height: 20),
        
              Divider(),
        
              // Developer Info
              ListTile(
                leading: Icon(Icons.person, color: Colors.grey[500]),
                title: Text("Developed by Kaleb Tesfahun" , style: TextStyle(color: Color(0xfff5f5f5), fontWeight: FontWeight.bold)),
                subtitle: Text("Developer", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
              ),
        
              // Version Info
              ListTile(
                leading: Icon(Icons.info_outline, color: Color(0xfff5f5f5)),
                title: Text("Version", style: TextStyle(color: Color(0xfff5f5f5), fontWeight: FontWeight.bold)),
                subtitle: Text("1.0.0", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
              ),
        
              // TMDB Disclaimer
              SizedBox(height: 20),
              Text(
                "This application uses TMDB and the TMDB APIs but is not endorsed, certified, or otherwise approved by TMDB.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xfff5f5f5)),
              ),
              SizedBox(height: 10),
        
              Center(
                child: Image(
                  image: NetworkImage(
                    'https://img.icons8.com/?size=512&id=AxHFXpfUuWsm&format=png'
                  ),
                   height: 50,
                ),
              ),
        
              SizedBox(height: 10),
        
              // External Links redirected when tapped using lanunch url
              Divider(),
              ListTile(
                leading: Icon(Icons.link, color: Color(0xfff5f5f5)),
                title: Text("Visit TMDB", style: TextStyle(color: Color(0xfff5f5f5), fontWeight: FontWeight.bold)),
                onTap: () => _launchURL(Uri.parse("https://www.themoviedb.org")),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.github , color: Color(0xfff5f5f5)),
                title: Text("GitHub Repository", style: TextStyle(color: Color(0xfff5f5f5), fontWeight: FontWeight.bold)),
                onTap: () => _launchURL(Uri.parse("https://github.com/kalutm/MovieXplorer.git")),
              ),
              ListTile(
                leading: Icon(Icons.email, color: Color(0xfff5f5f5)),
                title: Text("Contact Developer", style: TextStyle(color: Color(0xfff5f5f5), fontWeight: FontWeight.bold)),
                subtitle: Text("kalebtesfahun@gmail.com", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
                onTap: () => ApiResponse.launchEmail(),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.telegram, color: Color(0xfff5f5f5)),
                title: Text("Contact Me Via Telegram", style: TextStyle(color: Color(0xfff5f5f5), fontWeight: FontWeight.bold)),
                onTap: () => _launchURL(Uri.parse('https://t.me/kalutm')),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
