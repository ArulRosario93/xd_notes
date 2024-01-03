import 'package:flutter/material.dart';
import 'package:xd_notes/notes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xd_notes/pages/Homepage/homepage.dart';
import 'package:xd_notes/pages/Homepage/name.dart';
import 'package:xd_notes/pages/Homepage/notes.dart';
import 'package:xd_notes/pages/landingpage/showdialog.dart';

class thirdPage extends StatefulWidget {
  const thirdPage({super.key});

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  List<Map<String, Object>> list = [
    {"title": "Wake up b4 6", "selected": false}
  ];
  TextEditingController controller = TextEditingController();

  void openhive() async {
    boxNotes = await Hive.openBox<Notes>('notesBox');

    if (boxNotes.get('notes')!.note.length != 0) {
      setState(() {
        list = boxNotes.get('notes')!.note;
      });
    }else{
      boxNotes.put('notes', Notes(note: list));
    }
  }

  @override
  void initState() {
    openhive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void addToList() {
      if (controller.value.text.length > 0) {
        setState(() {
          list.add({"title": controller.value.text, "selected": false});
        });

        boxNotes.put('notes', Notes(note: list));
        controller.clear();
      }
    }

    void deletefromList(int Index) {
      setState(() {
        list.removeAt(Index);
      });

      boxNotes.put('notes', Notes(note: list));
    }

    void handleClick() {
      showDialog(
        context: context,
        builder: (context) =>
            showdialog(controller: controller, addToList: addToList),
      );
    }

    void handleNext() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homepage()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    // alignment: Alignment.center,
                    // fit: BoxFit.fitHeight,
                    fit: BoxFit.cover,
                    child: Text(
                      "xD",
                      style: GoogleFonts.abel(
                          textStyle: const TextStyle(fontSize: 100)),
                    ),
                  ),
                  FittedBox(
                    // alignment: Alignment.center,
                    fit: BoxFit.cover,
                    child: Text(
                      "Notes",
                      style: GoogleFonts.abel(
                          textStyle: const TextStyle(fontSize: 50)),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    "Create Your List",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 21,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  Expanded(
                    child: Container(
                // height: 250,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                      
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
                                  list[i]['title'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(fontSize: 16)),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    deletefromList(i);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                    ],
                  ),),
                ),),
                ],
              ),
             ),
                Flexible(
                  flex: 1,
                  child: Container(
                    // height: 80,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 1
                        )
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
            ),),
            Flexible(
              flex: 1,
              child:Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(4)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: handleNext,
                child: Text(
                  "Let's get Started",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
