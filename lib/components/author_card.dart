import 'package:flutter/material.dart';
import 'package:fooder_lich/config/fooderlich_theme.dart';
import 'package:fooder_lich/components/circle_image.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;



  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);



  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

bool _isFavorited = false;


class _AuthorCardState extends State<AuthorCard> {
  @override
  Widget build(BuildContext context) {



    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                  imageRadius: 28,
              ),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,


                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.displayMedium,
                  ),

                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.displaySmall,
                  ),
                ],
              ),
              const SizedBox(width: 10,),
              IconButton(
                  onPressed: () {
                    setState((){
                      _isFavorited = !_isFavorited;
                    });
                  },
                  icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border ),
                iconSize: _isFavorited ? 35 : 30,
                color: _isFavorited ? Colors.red : Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
