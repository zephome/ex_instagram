import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType {
  type1,
  type2,
  type3
}

class AvatarWidget extends StatelessWidget {
  bool? hasStory;
  String thumbPath;
  String? nickname;
  AvatarType type;
  double? size;

  AvatarWidget({
    Key? key,
    required this.type,
    required this.thumbPath,
    this.hasStory,
    this.nickname,
    this.size = 65
  }) : super(key: key);

  Widget type1Widget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.orange
            ],
          ),
        shape: BoxShape.circle
      ),
      child: type2Widget(),
    );
  }

  Widget type2Widget() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(65),
        child: SizedBox(
          width: size,
          height: size,
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget type3Widget() {
    return Row(
      children: [
        type1Widget(),
        Text(
          nickname?? '',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.type1:
        return type1Widget();
      case AvatarType.type2:
        return type2Widget();
      case AvatarType.type3:
        return type3Widget();
    }
  }
}
