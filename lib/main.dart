import 'package:ex_instagram/bindings/init_binding.dart';
import 'package:ex_instagram/controlles/auth/login_controller.dart';
import 'package:ex_instagram/screens/app_page.dart';
import 'package:ex_instagram/screens/home/home_root_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold
          )
        )
      ),
      initialBinding: InitBinding(),
      home: const AppPage(),
    );
  }
}


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const HomeRootPage());
          },
          child: Text('홈 이동'),
        ),
      ),
    );
  }
}
