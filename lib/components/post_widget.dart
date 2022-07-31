import 'package:cached_network_image/cached_network_image.dart';
import 'package:ex_instagram/components/asset_image_data.dart';
import 'package:ex_instagram/components/avatar_widget.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);
  
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          AvatarWidget(
              type: AvatarType.type3,
              nickname: 'ZePHomE',
              size: 45,
              thumbPath: 'https://t1.daumcdn.net/cfile/tistory/998C26415D1B512A08'
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssetImageData(
                icon: IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(imageUrl: 'https://t1.daumcdn.net/cfile/tistory/99E605405D1B513016');
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AssetImageData(icon: IconsPath.likeOffIcon, width: 65),
              const SizedBox(width: 15),
              AssetImageData(icon: IconsPath.replyIcon, width: 65),
              const SizedBox(width: 15),
              AssetImageData(icon: IconsPath.directMessage, width: 65),
            ],
          ),
          AssetImageData(icon: IconsPath.bookMarkOffIcon, width: 65)
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          '댓글 199개 모두 보기',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13
          ),
        ),
      ),
      onTap: () {},
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15
      ),
      child: Text(
        '1일전',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 11
        ),
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            '좋아요 150개',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          ExpandableText(
            '콘텐츠 1입니다.\n콘텐츠 1입니다.\n콘텐츠 1입니다.\n콘텐츠 1입니다.',
            prefixText: 'ZePHomE',
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.bold
            ),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
            onPrefixTap: () {
              print('prefix tap event');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 15),
          _image(),
          const SizedBox(height: 15),
          _infoCount(),
          const SizedBox(height: 15),
          _infoDescription(),
          const SizedBox(height: 15),
          _replyTextBtn(),
          _dateAgo()
        ],
      ),
    );
  }
}
