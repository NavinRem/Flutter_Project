import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(RootWidget());
}

//StatelessWidget is a widget that never changes its state during running time.
// It is immutable and can be used to create static UI components.
class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}

// StatefulWidget is a widget that can change its state during running time.
// It is mutable and can be used to create dynamic UI components.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _launchURL_social_media() async {
    final Uri url = Uri.parse('https://t.me/Navin_Dawan');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _launchURL_Linkedin() async {
    final Uri url = Uri.parse(
      'https://www.linkedin.com/in/sonavin-rem-900327315/',
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold is a material design layout structure that provides a framework for implementing the basic visual layout structure of the Material Design.
      // It provides APIs for showing drawers, snack bars, and bottom sheets.

      // AppBar is a material design app bar that can be used to display a title and actions.
      // It is usually placed at the top of the screen and can be customized with different styles and themes.
      appBar: AppBar(
        title: Text(
          "My Portfolio",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined, size: 30),
            onPressed: () {
              // Do something when the settings button is pressed
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 117, 211, 255),
      ),

      body: Container(
        margin: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'lib/assets/my-profile-pic.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome to my portfolio",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 144, 210, 1),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Hi, I'm \n",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Sonavin Rem",
                      style: TextStyle(
                        fontSize: 40,
                        color: Color.fromRGBO(0, 144, 210, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nJunior Flutter and Web Developer",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Passion in creating beautiful and functional applications.\nExperience in developing mobile and web applications using Flutter and Dart.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      width: 500,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Color.fromRGBO(0, 144, 210, 1),
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            Colors.white,
                          ),
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          ),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: _launchURL_social_media,
                        child: Text(
                          "Hire Me",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 500,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Color.fromRGBO(255, 255, 255, 1),
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Color.fromRGBO(0, 144, 210, 1),
                          ),
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          ),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                color: Color.fromRGBO(0, 144, 210, 1),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        onPressed: _launchURL_Linkedin,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Downlaod My CV"),
                            SizedBox(width: 5),
                            Icon(
                              Icons.download_rounded,
                              size: 20,
                              color: Color.fromRGBO(0, 144, 210, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
