import 'package:flutter/material.dart';
import 'package:fooder_lich/components/card3.dart';
import 'package:fooder_lich/models/models.dart';
import 'package:fooder_lich/screens/exlore_screen.dart';
import 'package:fooder_lich/screens/grocery_screen.dart';
import 'package:fooder_lich/screens/recipe_gride_view_one_page/recipe_screen.dart';
import 'package:fooder_lich/screens/recipes_screen.dart';
import 'package:provider/provider.dart';


import 'components/card1.dart';
import 'components/card2.dart';
import 'package:fooder_lich/config/fooderlich_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final theme = FooderlichTheme.dark();

  static List<Widget> pages = <Widget> [
    ExloreScreen(),
    RecipesScreen(),
    GroceryScreen(),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child){
      return Scaffold(
        backgroundColor: Colors.grey[900],


        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
              "Nourriture",
              style: theme.textTheme.headlineLarge
          ),
        ),


        //body: pages[_selectedIndex],

        body: IndexedStack(index: tabManager.selectedTab, children: pages),


        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white.withOpacity(0.7),
            backgroundColor: Colors.grey[900],
            selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
            /*currentIndex: _selectedIndex,
            onTap: _onItemTapped,*/
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              // 4
              tabManager.goToTab(index);
            },

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "Recettes",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "Acheter",
              ),
            ]
        ),
      );
    },
    );
  }
}
