import 'package:hive/hive.dart';
part 'notebox.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String title;
  @HiveField(1)
  String notes;
  @HiveField(2)
  String id;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  bool favourite;

  Note({
    required this.title,
    required this.notes,
    required this.id,
    required this.createdAt,
    required this.favourite,
  });
}
