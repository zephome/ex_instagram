import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layouts/bottom_navigation_page.dart';
import 'search_focus.dart';

class SearchRootPage extends StatelessWidget {
  const SearchRootPage({Key? key}) : super(key: key);
  
  Widget _appbar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(SearchFocus());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 15
              ),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey
              ),
              child: Row(
                children: const <Widget>[
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.location_pin),
        )
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _appbar(),
            Expanded(child: _body())
          ],
        ),
      ),
      //bottomNavigationBar: const BottomNavigationPage(),
    );
  }
}
