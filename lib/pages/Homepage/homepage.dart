import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xd_notes/pages/landingpage/showdialog.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> list = ["Wake up b4 4", "Drink water", "Do exercise"];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void deletedtask(int index) {
      setState(() {
        list.removeAt(index);
      });
    }

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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Hey, Ro",
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.black, fontSize: 35)),
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Big Day",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "29/11",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            Expanded(
                child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < list.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Slidable(
                          endActionPane:
                              ActionPane(motion: StretchMotion(), children: [
                            SlidableAction(
                              onPressed: (context) => deletedtask(i),
                              icon: Icons.delete,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Color.fromARGB(255, 255, 0, 0),
                              foregroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                            ),
                          ]),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                Text(
                                  (i + 1).toString() + ".",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    list[i],
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      list.length < 4? Container(
                        alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 60,),
                              Text("Lot More", style: GoogleFonts.bowlbyOne(textStyle: TextStyle(fontSize: 25, color: Colors.black)),),
                              Text("To Add On Ro", style: GoogleFonts.bowlbyOne(textStyle: TextStyle(fontSize: 25, color: Colors.black)),),
                            ],
                          ),
                        ): Container(),
                  ],
                ),
              ),
            )),

            SizedBox(
              height: 30,
            ),
            // Text("HOLA THERE")
          ],
        ),
      ),
      floatingActionButton: Container(
        // padding: EdgeInsets.all(30),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 0))
          ],
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        // alignment: Alignment.center,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                primary: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed:() => handleClick(),
            child: Icon(
              Icons.add,
              color: Colors.black,
            )),
      ),
    );
  }
}
