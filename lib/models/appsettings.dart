import 'package:isar/isar.dart';

part 'appsettings.g.dart';

@Collection()
class Appsettings {
  Id id = Isar.autoIncrement;

  DateTime? firstLaunchedDate;
}
