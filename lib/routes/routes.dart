import 'package:e_commerce_ux/pages/details_page/view.dart';
import 'package:e_commerce_ux/pages/home_page/binding.dart';
import 'package:e_commerce_ux/pages/home_page/view.dart';
import 'package:e_commerce_ux/routes/names.dart';
import 'package:get/get.dart';

import '../pages/details_page/details_index.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: ApprouteNames.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: ApprouteNames.detailsPage,
      page: () => DetailsPage(),
      binding: DetailsBinding(),
    ),
  ];
}
