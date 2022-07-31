import 'package:flutter/material.dart';

import '../../layouts/bottom_navigation_page.dart';

class ActivityRootPage extends StatelessWidget {
  const ActivityRootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACTIVITY'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('ACTIVITY'),
      ),
      bottomNavigationBar: const BottomNavigationPage(),
    );
  }
}
