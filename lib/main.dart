import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:xd_notes/noti.dart';
import 'package:xd_notes/pages/Homepage/homepage.dart';
import 'package:xd_notes/pages/Homepage/name.dart';
import 'package:xd_notes/notes.dart';
import 'package:xd_notes/pages/Homepage/notes.dart';
import 'pages/landingpage/firstpage.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NameAdapter());
  Hive.registerAdapter(NotesAdapter());
  boxNotes = await Hive.openBox<Notes>('notesBox');
  // BoxName = await Hive.openBox<Name>('nameBox');
  // await LocalNotificationService().init();
    final noteLength = boxNotes.get("notes");
  Future.delayed(const Duration(seconds: 2), () {
    runApp(MyApp(len: noteLength));
  });
}

class MyApp extends StatelessWidget {
  final len;
  const MyApp({super.key, this.len});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: len != null ?homepage() : firstPage(),
      theme: ThemeData(
          primarySwatch: MaterialColor(
              Color.fromARGB(243, 255, 255, 255).value, const <int, Color>{
        50: Color.fromARGB(243, 255, 255, 255),
        100: Color.fromARGB(243, 255, 255, 255),
        200: Color.fromARGB(243, 255, 255, 255),
        300: Color.fromARGB(243, 255, 255, 255),
        400: Color.fromARGB(243, 255, 255, 255),
        500: Color.fromARGB(243, 255, 255, 255),
        600: Color.fromARGB(243, 255, 255, 255),
        700: Color.fromARGB(243, 255, 255, 255),
        800: Color.fromARGB(243, 255, 255, 255),
        900: Color.fromARGB(243, 255, 255, 255),
      })),
    );
  }
}
