import 'package:hive/hive.dart';

part 'name.g.dart';

@HiveType(typeId: 1)
class Name {
  Name({required this.note,});

  // add the notes
  @HiveField(0)
  String note;
}
