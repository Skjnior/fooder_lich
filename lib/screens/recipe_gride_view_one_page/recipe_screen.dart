import 'package:flutter/material.dart';

import '../../api/mock_fooderlich_service.dart';
import '../../components/recipe_grid_view.dart';
import '../../models/simple_recipe.dart';



class RecipesScreen_on_page extends StatelessWidget {
  final exploreService = MockFooderlichService();

  RecipesScreen_on_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator(
            color: Colors.greenAccent,
          ),
          );
        }
      },
    );
  }
}

