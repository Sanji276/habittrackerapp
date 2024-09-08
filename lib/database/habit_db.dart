import 'package:flutter/material.dart';
import 'package:habittrackerapp/models/habit.dart';
import 'package:isar/isar.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar _isar;

  static Future<void> init() async {
    final dir = 'D:\\Flutter_Projects\\habitdb\\';
    _isar = await Isar.open([HabitSchema], directory: dir);
  }

  List<Habit> listofhabits = [];

  Future<void> refreshHabit() async {
    List<Habit> fetchedHabits = await _isar.habits.where().findAll();

    listofhabits.clear();
    listofhabits.addAll(fetchedHabits);
  }

  Future<void> addHabit(Habit habit) async {
    await _isar.writeTxn(() => _isar.habits.put(habit));
    refreshHabit();
    notifyListeners();
  }
}
