import 'package:flutter/material.dart';
import 'package:gabbar_chai/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            //shop name
            Text(
              "GABBAR CHAI",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("lib/images/gabbar_chai.png"),
            ),
            const SizedBox(height: 10),
            //title
            Text(
              "EVEN GABBAR'S FAVOURITE AB CHAI PI",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 33,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            //subtitle
            Text(
              "We believe tea should taste as good as it feels. Good for your soul, good for your health, Always. Only the good stuff, not the sweepings.",
              style: TextStyle(color: Colors.grey[300]),
            ),
            const SizedBox(height: 25),
            //get started button
            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
