import 'package:flutter/material.dart';
import 'package:fooder_lich/components/components.dart';

import '../models/post.dart';


class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

   FriendPostListView({Key? key, required this.friendPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Socilal Chefs",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16,),
          ListView.separated(
            primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendsPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16,);
            },

          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
