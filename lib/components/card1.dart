import 'package:flutter/material.dart';
import 'package:fooder_lich/config/fooderlich_theme.dart';
import 'package:fooder_lich/models/explore_recipe.dart';



class Card1 extends StatelessWidget {

  final ExploreRecipe recipe;
  const Card1({Key? key, required  this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),

        constraints:  const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),

        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),

        child: Stack(
          children: [
            Text(
              recipe.subtitle,
              style: FooderlichTheme.darkTextTheme.bodyLarge,
            ),
            Positioned(
              child: Text(
                recipe.title,
                style: FooderlichTheme.darkTextTheme.displayMedium,
              ),
              top: 20,
            ),
            Positioned(
              child: Text(
                recipe.message,
                style: FooderlichTheme.darkTextTheme.bodyLarge,
              ),
              bottom: 30,
              right: 0,
            ),
            Positioned(
              child: Text(
                recipe.authorName,
                style: FooderlichTheme.darkTextTheme.bodyLarge,
              ),
              bottom: 10,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}
