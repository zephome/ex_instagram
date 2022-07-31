
import 'package:ex_instagram/components/asset_image_data.dart';
import 'package:ex_instagram/components/avatar_widget.dart';
import 'package:ex_instagram/components/post_widget.dart';
import 'package:flutter/material.dart';

import '../../layouts/bottom_navigation_page.dart';

class HomeRootPage extends StatelessWidget {
  const HomeRootPage({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: <Widget>[
        AvatarWidget(
          type: AvatarType.type2,
          thumbPath: 'https://t1.daumcdn.net/cfile/tistory/998C26415D1B512A08',
          size: 70,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(
                color: Colors.white,
                width: 2
              )
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()),
    );
  }
  
  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 0
      ),
      child: Row(
        children: <Widget>[
          _myStory(),
          ...List.generate(
              10, (index) => AvatarWidget(
              type: AvatarType.type1,
              thumbPath: 'https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E'
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AssetImageData(icon: IconsPath.logo, width: 270),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: AssetImageData(icon: IconsPath.directMessage, width: 50),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          _storyBoardList(),
          _postList()
        ],
      ),
      //bottomNavigationBar: const BottomNavigationPage(),
    );
  }
}
