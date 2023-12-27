import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xd_notes/pages/landingpage/showdialog.dart';

class thirdPage extends StatefulWidget {
  const thirdPage({super.key});

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  List<String> list = ["Wake up b4 4", "Drink water", "Do exercise"];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void addToList() {
      setState(() {
        list.add(controller.value.text);
      });
      print(controller.value.text);
      controller.clear();
    }

    void handleClick() {
      showDialog(
        context: context,
        builder: (context) =>
            showdialog(controller: controller, addToList: addToList),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
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
            Container(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Create Your List",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 19,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (int i = 0; i < list.length; i++)
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              Text(
                                (i + 1).toString() + ".",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 16)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  list[i],
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(fontSize: 16)),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )),
            Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1)
                ],
              ),
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: handleClick),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                maxWidth: 360,
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(4)),
              child: Text(
                "Let's get Started",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
