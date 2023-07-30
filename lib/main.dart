import 'package:e_commerce_ux/pages/details_page/view.dart';
import 'package:e_commerce_ux/pages/home_page/view.dart';
import 'package:e_commerce_ux/routes/names.dart';
import 'package:e_commerce_ux/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: (context, _) {
          return GetMaterialApp(
            getPages: AppRoutes.routes,
            initialRoute: ApprouteNames.homePage,
          );
        });
  }
}
