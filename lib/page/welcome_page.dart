import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //  SingleChildScrollView(
          //    scrollDirection: Axis.vertical,
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Welcome!! 😀 \n'
                "You have just logged into your SWIM APP personal profile.\n"
                "Scroll with the navigation bar at the bottom of the screen to customize your swim trainings or create your own.\n"
                "Once you have created your workouts, you can mark the various exercises as completed to remind you if you managed to complete all the planned exercises.\n\n"
                "It's time to train! 💪",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Expanded(
            // flex: 3,
            child: Image(
              image: AssetImage("assets/img_nuoto.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
