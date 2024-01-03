import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 2)
class Notes {
  Notes({required this.note,});

  // add the notes
  @HiveField(0)
  List<Map<String, Object>> note;
}
