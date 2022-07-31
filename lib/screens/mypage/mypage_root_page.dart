import 'package:flutter/material.dart';

import '../../layouts/bottom_navigation_page.dart';

class MypageRootPage extends StatelessWidget {
  const MypageRootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MYPAGE'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('MYPAGE'),
      ),
      bottomNavigationBar: const BottomNavigationPage(),
    );
  }
}
