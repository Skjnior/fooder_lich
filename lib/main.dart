import 'package:flutter/material.dart';
import 'package:fooder_lich/home_screen.dart';
import 'config/fooderlich_theme.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'modles/grocery_manager.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final theme = FooderlichTheme.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Fooderlich',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
          child: const Home()
      ),
    );
  }
}
