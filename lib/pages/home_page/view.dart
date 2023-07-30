import 'dart:ui';

import 'package:e_commerce_ux/data/grocery_items.dart';
import 'package:e_commerce_ux/pages/cart_page/view.dart';
import 'package:e_commerce_ux/pages/home_page/widgets.dart';
import 'package:e_commerce_ux/shared/common/app_bar.dart';
import 'package:e_commerce_ux/shared/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'home_index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTapUp: controller.handleTap,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PageView(
              controller: controller.state.pageController,
              padEnds: false,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  height: size.height.h,
                  width: size.width.w,
                  decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.r),
                        bottomRight: Radius.circular(50.r),
                      )),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: size.height.h - 294.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50.r),
                                bottomRight: Radius.circular(50.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: MasonryGridView.count(
                                  itemCount:
                                      controller.state.groceryItems.length,
                                  crossAxisCount: 2,
                                  // mainAxisSpacing: 5.h,
                                  // crossAxisSpacing: 5.w,
                                  itemBuilder: (context, index) {
                                    final alterIndex =
                                        index > 1 ? index - 1 : index;
                                    final product = controller
                                        .state.groceryItems[alterIndex];
                                    return index == 1
                                        ? kHeight(50)
                                        : kItemCard(
                                            context: context,
                                            product: product,
                                            controller: controller);
                                  },
                                ),
                              )),
                        ),
                      ),
                      kHomeAppBar(
                          size: size,
                          context: context,
                          title: 'Pasta & Noodles'),
                    ],
                  ),
                ),
                GestureDetector(
                  onVerticalDragUpdate: (details) =>
                      controller.verticalDragControl(details),
                  child: CartPage(
                    size: size,
                    controller: controller,
                  ),
                ),
              ],
            ),
            GetBuilder(
                init: controller,
                builder: (controller) {
                  return Positioned(
                    left: controller.state.tapX - 50,
                    top: controller.state.tapY - 50,
                    child: SizedBox(
                      height: 100.h,
                      width: 100.h,
                      child: RiveAnimation.asset(
                        'assets/tap_anim.riv',
                        onInit: controller.onRiveInit,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
