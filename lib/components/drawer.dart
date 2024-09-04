import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habittrackerapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      elevation: 0,

      child: Column(
        children: [
           Column(
            children: [
              DrawerHeader(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text('Menu'),
                        CupertinoSwitch(value: Provider.of<ThemeProvider>(context).isDarkmode,
                         onChanged:(value)=> Provider.of<ThemeProvider>(context,listen: false).themeToogle())
                      ],
                    ),
                    ), 

              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),                
              )
            ],
           ) 
  
        ],
      ),
    );
  }
}