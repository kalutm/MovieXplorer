import 'package:flutter/material.dart';
import 'package:x_movie/screens/home/home.dart';
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _welcomeState();
}

class _welcomeState extends State<Welcome> {
  // Initializing a 3 second Duration before building the widget
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), (){
      // Checking if the widget still exists after an async gap, by using mounted
      if(mounted){
      // Navigating to the Home screen one the delay is done
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(),)

        );}
    });
  }
  @override
 Widget build(BuildContext context){
  return Scaffold(
      backgroundColor: Colors.black, 
      // Using a SafeArea since we dont have an AppBar
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Movie Xplorer",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff5f5f5), 
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 40),
              // Using ClipRRect for Rounded corner
              ClipRRect(
                borderRadius: BorderRadius.circular(20), 
                child: Image.asset(
                  "assets/icon/logo2.jpg",
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}