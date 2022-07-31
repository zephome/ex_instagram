
import 'package:ex_instagram/screens/activity/activity_root_page.dart';
import 'package:ex_instagram/screens/mypage/mypage_root_page.dart';
import 'package:ex_instagram/screens/search/search_root_page.dart';
import 'package:get/get.dart';

import '../screens/home/home_root_page.dart';
import '../screens/upload/upload_screen.dart';

enum PageName {
  home,
  search,
  upload,
  activity,
  mypage
}

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    print('move page index ${value}');

    /*switch (page) {
      case PageName.upload:
        Get.to(() => const UploadScreen());
        break;
      case PageName.home:
        Get.to(() => const HomeRootPage());
        currentIndex(value);
        break;
      case PageName.search:
        Get.to(() => const SearchRootPage());
        currentIndex(value);
        break;
      case PageName.activity:
        Get.to(() => const ActivityRootPage());
        currentIndex(value);
        break;
      case PageName.mypage:
        Get.to(() => const MypageRootPage());
        currentIndex(value);
        //_changePage(value, hasGesture: hasGesture);
        break;
    }*/

    switch (page) {
      case PageName.upload:
        Get.to(() => const UploadScreen());
        break;
      case PageName.home:
      case PageName.search:
      case PageName.activity:
      case PageName.mypage:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true})
  {
    currentIndex(value);

    if (!hasGesture) {
      return;
    }

    bottomHistory.remove(value);
    bottomHistory.add(value);

    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}