import 'package:flutter/material.dart';
import 'package:habittrackerapp/components/drawer.dart';
import 'package:habittrackerapp/database/habit_db.dart';
import 'package:habittrackerapp/models/habit.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitDatabase>(context);
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
              context: context,
              builder: (context) => Column(
                    children: [
                      AlertDialog(
                        title: const Text('Add Habit'),
                        content: TextFormField(
                            controller: textController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final habitName = textController.text.trim();
                            if (habitName.isNotEmpty) {
                              Habit newHabit = Habit()
                                ..name = habitName
                                ..completedDays = [DateTime.now()];

                              habitProvider.addHabit(newHabit);
                              textController.clear(); // Clear the input field
                              Navigator.of(context).pop(); // Close the dialog
                            } else {
                              // Show a message if the input is empty
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please enter a habit name.')),
                              );
                            }
                          },
                          child: Text('Add'))
                    ],
                  )),
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
