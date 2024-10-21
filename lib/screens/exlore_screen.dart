import 'package:flutter/material.dart';
import 'package:fooder_lich/api/mock_fooderlich_service.dart';
import 'package:fooder_lich/components/components.dart';
import 'package:fooder_lich/models/explore_data.dart';




class ExloreScreen extends StatelessWidget {
   ExloreScreen({super.key});
  final mockService = MockFooderlichService();



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            final recipes = snapshot.data?.todayRecipes ?? [];
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
                const SizedBox(height: 16,),
                FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
              ],
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
        }
    );
  }
}
