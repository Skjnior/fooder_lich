import 'package:flutter/material.dart';
import 'package:fooder_lich/modles/grocery_manager.dart';
import 'package:fooder_lich/screens/grocery_item_screen.dart';
import 'package:provider/provider.dart';
import 'grocery_list_screen.dart';
import 'empty_grocery_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGroceryScreen(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final manager = Provider.of<GroceryManager>(context, listen: false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroceryItemScreen(
                    onCreate: (item) {
                      manager.addItem(item);
                      Navigator.pop(context);
                    },
                    onUpdate: (item) {}),
              ),
            );
          }),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.groceryItems.isNotEmpty) {
        return GroceryListScreen(manager: manager);
      } else {
        return EmptyGroceryScreen();
      }
    });
  }
}
