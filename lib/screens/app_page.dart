
import 'package:ex_instagram/components/asset_image_data.dart';
import 'package:ex_instagram/controlles/bottom_nav_controller.dart';
import 'package:ex_instagram/screens/home/home_root_page.dart';
import 'package:ex_instagram/screens/search/search_root_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPage extends GetView<BottomNavController> {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return const HomeRootPage();

    // 뒤로 가기 버튼
    return WillPopScope(
        onWillPop: controller.willPopAction,
        child: Obx(() => Scaffold(
            /*appBar: AppBar(
              title: const Text('HOME'),
            ),*/
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: <Widget>[
                HomeRootPage(),
                Navigator(
                  key: controller.searchPageNavigationKey,
                  onGenerateRoute: (routeSetting) {
                    return MaterialPageRoute(builder: (context) => SearchRootPage());
                  },
                ),
                Container(child: Center(child: Text('UPLOAD'))),
                Container(child: Center(child: Text('ACTIVITY'))),
                Container(child: Center(child: Text('MYPAGE'))),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                  icon: AssetImageData(icon: IconsPath.homeOff),
                  activeIcon: AssetImageData(icon: IconsPath.homeOn),
                  label: 'home'
                ),
                BottomNavigationBarItem(
                  icon: AssetImageData(icon: IconsPath.searchOff),
                  activeIcon: AssetImageData(icon: IconsPath.searchOn),
                  label: 'search'
                ),
                BottomNavigationBarItem(
                  icon: AssetImageData(icon: IconsPath.uploadIcon),
                  label: 'upload'
                ),
                BottomNavigationBarItem(
                  icon: AssetImageData(icon: IconsPath.activeOff),
                  activeIcon: AssetImageData(icon: IconsPath.activeOn),
                  label: 'active'
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                    ),
                  ),
                  label: 'home'
                ),
              ],
            ),
          ),
        )
    );
  }
}
