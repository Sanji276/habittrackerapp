import 'package:flutter/cupertino.dart';
import 'package:habittrackerapp/models/habit.dart';
import 'package:habittrackerapp/services/isar_service.dart';

class HabitProvider extends ChangeNotifier {
  final IsarService _isarService = IsarService();

  //initialize isar service
  Future<void> init() async {
    await _isarService.init();
    await _isarService.refreshHabits();
    notifyListeners();
  }

  //add habit
  Future<void> addHabit(Habit habit) async {
    await _isarService.addHabit(habit);
    notifyListeners();
  }

  //update habit
  Future<void> updateHabit(Habit habit) async {
    await _isarService.updateHabits(habit);
    notifyListeners();
  }

  //delete habit
  Future<void> deleteHabit(int id) async {
    await _isarService.deleteHabits(id);
    notifyListeners();
  }
}
