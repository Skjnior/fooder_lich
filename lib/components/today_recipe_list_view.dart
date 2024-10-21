import 'package:flutter/material.dart';
import 'package:fooder_lich/models/explore_recipe.dart';

import 'card1.dart';
import 'card2.dart';
import 'card3.dart';


class TodayRecipeListView extends StatelessWidget {

  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({Key? key, required this.recipes}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Recettes d'aujourd'hui ",
            ),
          ),
          const SizedBox(height: 16,),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  final recipe = recipes[index];
                  return builCard(recipe);
                },
                separatorBuilder: (context, index){
                  return const SizedBox(width: 16,);
                },
                itemCount: recipes.length,
            ),
          ),

        ],
      ),
    );
  }
  Widget builCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception("Cette card n'existe pas");
    }
  }


}



