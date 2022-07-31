import 'package:ex_instagram/components/asset_image_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuItem(String menuName) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 15
      ),
      child: Text(
        menuName,
        style: const TextStyle(
            fontSize: 15,
            color: Colors.black87
        ),
      ),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Container(
        width: Size.infinite.width,
        height: AppBar().preferredSize.height,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffe4e4e4)
            )
          )
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.black87,
          tabs: <Widget>[
            _tabMenuItem('인기'),
            _tabMenuItem('계정'),
            _tabMenuItem('오디오'),
            _tabMenuItem('태그'),
            _tabMenuItem('장소')
          ],
        ),
      ),
    );
  }
  
  Widget _body() {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        Center(
          child: Text('인기 페이지'),
        ),
        Center(
          child: Text('계정 페이지'),
        ),
        Center(
          child: Text('오디오 페이지'),
        ),
        Center(
          child: Text('태그 페이지'),
        ),
        Center(
          child: Text('장소 페이지'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: AssetImageData(
              icon: IconsPath.backBtnIcon,
            ),
          ),
        ),
        titleSpacing: 0,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '검색',
                contentPadding: EdgeInsets.only(
                  left: 15,
                  top: 7,
                  bottom: 7
                ),
              isDense: true
            ),
          ),
        ),
        bottom: _tabMenu(),
      ),
      body: _body(),
    );
  }
}
