import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modles/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
   EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                  aspectRatio: 1 / 1,
                child: Image.asset("assets/fooderlich_assets/empty_list.png"),
              ),
            ),
            const Text(
              "Pas d'épices",
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(height: 16.0,),
            const Text(
              "Voulez-vous achetez des ingrédients ?\n"
              "Appuyez sur le bouton + pour les noter!",
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
                child: const Text("Parcourir nos recettes"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.green,
                onPressed: () {
                  Provider.of(context, listen: false).goToRecipes();
                }
            ),
          ],
        ),
      ),
    );
  }
}
