import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xd_notes/pages/landingpage/secondpage.dart';

// ignore: camel_case_types, must_be_immutable
class firstPage extends StatelessWidget {
  firstPage({super.key});

  @override
  Widget build(BuildContext context) {
    void handleClick() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const secondpage(),
          ));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "XD",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 100),
                        color: Colors.white),
                  ),
                  Text(
                    "Notes",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 50)),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Where the",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 25)),
                ),
                Text(
                  "Dreams",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 35)),
                ),
                Text(
                  "Begin",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 40)),
                ),
              ],
            ),
            SizedBox(
              height: 48,
            )
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.arrow_right_alt_rounded,
          size: 30,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        color: Colors.black,
        onPressed: handleClick,
      ),
    );
  }
}
