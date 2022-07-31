import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/asset_image_data.dart';
import '../controlles/bottom_nav_controller.dart';

class BottomNavigationPage extends GetView<BottomNavController> {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
