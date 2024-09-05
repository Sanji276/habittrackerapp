import 'package:habittrackerapp/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Isar isar;

  // initializing the isar service and providing path
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([HabitSchema], directory: dir.path);
  }

  final List<Habit> listofHabits = [];
  Future<void> addHabit(Habit habit) async {
    //create a new habit
    final newHabit = Habit()..name = habit.name;
    await isar.writeTxn(() async {
      await isar.habits.put(newHabit);
    });

    //read habits from db
    refreshHabits();
  }

  //READ
  Future<void> refreshHabits() async {
    final allHabits = await isar.habits.where().findAll();
    listofHabits.clear();
    listofHabits.addAll(allHabits);
  }

  //UPDATE
  Future<void> updateHabits(Habit updatedHabit) async {
    final habit = await isar.habits.get(updatedHabit.id);
    if (habit != null) {
      await isar.writeTxn(() async {
        habit.name = updatedHabit.name;
      });
    }

    refreshHabits();
  }

  //DELETE
  Future<void> deleteHabits(int habitId) async {
    final habit = await isar.habits.get(habitId);
    if (habit != null) {
      await isar.habits.delete(habitId);
    }
    refreshHabits();
  }
}
