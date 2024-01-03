// ignore: prefer_interpolation_to_compose_strings
// ignore: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xd_notes/notes.dart';
import 'package:xd_notes/pages/Homepage/name.dart';
import 'package:xd_notes/pages/Homepage/notes.dart';
import 'package:xd_notes/noti.dart';
import 'package:xd_notes/pages/landingpage/showdialog.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Map<String, Object>> list = [];
  DateTime dateToday = DateTime.now();
  TextEditingController controller = TextEditingController();

  void openhive() async {
    BoxName = await Hive.openBox<Name>('nameBox');
    boxNotes = await Hive.openBox<Notes>('notesBox');

    setState(() {
      list = boxNotes.get('notes')!.note;
    });
  }

  @override
  void initState() {
    openhive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void deletedtask(int index) {
      setState(() {
        list.removeAt(index);
      });

      boxNotes.put('notes', Notes(note: list));
    }

    void addToList() async {
      if (controller.value.text.length > 0) {
        setState(() {
          list.add({"title": controller.value.text, "selected": false});
        });
        boxNotes.put('notes', Notes(note: list));
        controller.clear();
      }

      // LocalNotificationService().showTimedNotification();
    }

    void handleClick() {
      showDialog(
        context: context,
        builder: (context) =>
            showdialog(controller: controller, addToList: addToList),
      );
    }

    void taskTapped(int Index) {
      setState(() {
        list[Index]["selected"] =
            (list[Index]["selected"] != false ? false : true);
      });

      boxNotes.put('notes', Notes(note: list));
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(209, 39, 241, 214),
        centerTitle: true,
        elevation: 1,
        toolbarHeight: 90.0,
        title: Text(
          "xD Notes",
          style: GoogleFonts.actor(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25)),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Hey, " + BoxName.get("name").note,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 25)),
            ),

            const SizedBox(
              height: 4,
            ),

            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Today",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(179, 255, 255, 255),
                          fontSize: 14)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  dateToday.day.toString() + " / " + dateToday.month.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color.fromARGB(179, 255, 255, 255),
                          fontSize: 14)),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < list.length; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
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
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ]),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () => taskTapped(i),
                                  icon: Icon(
                                    list[i]["selected"] == true
                                        ? Icons.check_circle
                                        : Icons.circle,
                                    color: list[i]["selected"] == true
                                        ? const Color.fromARGB(
                                            171, 255, 255, 255)
                                        : Colors.white,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  list[i]["title"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          decoration:
                                              list[i]["selected"] == true
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                          fontSize: 18,
                                          color: list[i]["selected"] == true
                                              ? const Color.fromARGB(
                                                  171, 255, 255, 255)
                                              : Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  list.length < 4
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Text(
                                "Lot More",
                                style: GoogleFonts.bowlbyOne(
                                    textStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 25,
                                        color: Colors.black)),
                              ),
                              Text(
                                "To Add On Ro",
                                style: GoogleFonts.bowlbyOne(
                                    textStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 25,
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
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
          color: Color.fromARGB(255, 39, 241, 214),
          boxShadow: [
            // BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     blurRadius: 10,
            //     spreadRadius: 2,
            //     offset: Offset(0, 0))
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        // alignment: Alignment.center,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                primary: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () => handleClick(),
            child: Icon(
              Icons.add,
              size: 25,
              color: Color.fromARGB(255, 0, 0, 0),
            )),
      ),
    );
  }
}
