import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xd_notes/pages/landingpage/askname.dart';
import 'package:xd_notes/pages/landingpage/thirdpage.dart';

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  TextEditingController controller = TextEditingController();
  bool err = false;

  @override
  Widget build(BuildContext context) {
    void handleClick() {
      if (controller.value.text.length <= 2) {
        setState(() {
          err = true;
        });
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const thirdPage(),
          )
        );
      }
      // print(controller.value.text.length);

    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  "Say Your Name",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 30,
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 280),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child:
                      askName(controller: controller, handleClick: handleClick),
                ),

                err? Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child:  Row(
                    children: [
                      Icon(Icons.priority_high, color: Colors.red,),
                      SizedBox(width: 10,),
                      Text(
                        "Your name is too small",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 10,
                          color: const Color.fromARGB(255, 255, 255, 255)
                        )),
                      ),
                    ],
                  )
                ): Container()
              ],
            ),
            SizedBox(
              height: 50,
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
