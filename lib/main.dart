import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/edit/edit_binding.dart';
import 'package:turkuazmobil/edit/edit_view.dart';
import 'package:turkuazmobil/my_activity/my_activity_binding.dart';
import 'package:turkuazmobil/my_activity/my_activity_view.dart';
import 'package:turkuazmobil/my_activity_image/my_activity_image_binding.dart';
import 'package:turkuazmobil/profile_edit/profile_edit_view.dart';
import 'package:turkuazmobil/verify/verify_binding.dart';
import 'package:turkuazmobil/verify/verify_view.dart';
import 'package:turkuazmobil/verify_image/verify_image_binding.dart';
import 'package:turkuazmobil/verify_image/verify_image_view.dart';
import 'menu/menu_binding.dart';
import 'menu/menu_view.dart';
import 'my_activity_image/my_activity_image_view.dart';
import 'profile_edit/profile_edit_binding.dart';
import 'surveys/surveys_binding.dart';
import 'surveys/surveys_view.dart';
import 'images/images_binding.dart';
import 'images/images_view.dart';
import 'login/login_binding.dart';
import 'login/login_view.dart';
import 'profile/profile_binding.dart';
import 'profile/profile_view.dart';







void main() {
    runApp(MyApp());
  }


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Turkuaz',
      getPages: [
        GetPage(name: "/LoginPage", page: ()=>LoginPage(), binding: LoginBinding()),
        GetPage(name: "/MenuPage", page: ()=>MenuPage(),binding: MenuBinding()),
        GetPage(name: "/ProfilePage", page: ()=>ProfilePage(),binding: ProfileBinding()),
        GetPage(name: '/SurveysPage', page: ()=>SurveysPage(),binding: SurveysBinding()),
        GetPage(name: '/ImagesPage', page: ()=>ImagesPage(),binding: ImagesBinding()),
        GetPage(name: '/EditPage',page: ()=>EditPage(),binding: EditBinding()),
        GetPage(name: '/MyActivityPage', page: ()=>MyActivityPage(),binding: MyActivityBinding()),
        GetPage(name: '/MyActivityImagePage', page: ()=>MyActivityImagePage(),binding: MyActivityImageBinding()),
        GetPage(name: '/VerifyPage', page: ()=> VerifyPage(),binding: VerifyBinding()),
        GetPage(name: '/ProfileEditPage', page: ()=> ProfileEditPage(), binding: ProfileEditBinding()),
        GetPage(name: '/VerifyImagePage', page: ()=> VerifyImagePage(), binding: VerifyImageBinding()),

      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/LoginPage",
    );
  }
}

