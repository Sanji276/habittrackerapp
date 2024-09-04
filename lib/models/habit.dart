

import 'package:isar/isar.dart';

//run cmd to generate file: dart run build_runner build
part 'habit.g.dart';

//isar is used for offline database
class Habit {
  //habit id
  Id id = Isar.autoIncrement;

  //name
  late String name;

  //completed days
  List<DateTime> completedDays = [];
}