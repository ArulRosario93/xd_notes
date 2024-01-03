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
          children: [
            Flexible(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "XD",
                      style: GoogleFonts.bhuTukaExpandedOne(
                          textStyle: const TextStyle(fontSize: 100),),
                    ),
                    Text(
                      "Notes",
                      style: GoogleFonts.bhuTukaExpandedOne(
                          textStyle: const TextStyle(fontSize: 50)),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex:4 ,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Where the",
                    style: GoogleFonts.bhuTukaExpandedOne(
                        textStyle: const TextStyle(fontSize: 25)),
                  ),
                  Text(
                    "Dreams",
                    style: GoogleFonts.bhuTukaExpandedOne(
                        textStyle: const TextStyle(fontSize: 35)),
                  ),
                  Text(
                    "Begin",
                    style: GoogleFonts.bhuTukaExpandedOne(
                        textStyle: const TextStyle(fontSize: 40)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_right_alt_rounded,
          size: 30,
          color: Color.fromARGB(255, 0, 0, 0),
        ),  
        // color: Colors.black,
        onPressed: handleClick,
      ),
    );
  }
}
