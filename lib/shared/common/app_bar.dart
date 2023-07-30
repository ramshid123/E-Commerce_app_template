import 'package:e_commerce_ux/pages/details_page/controller.dart';
import 'package:e_commerce_ux/pages/home_page/view.dart';
import 'package:e_commerce_ux/routes/names.dart';
import 'package:e_commerce_ux/shared/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

PreferredSize kHomeAppBar(
    {required Size size,
    required BuildContext context,
    required String title}) {
  return PreferredSize(
    preferredSize: Size(size.width.w, 70.h),
    child: Container(
      height: 70.h,
      width: size.width.w,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFF8E1),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFFF8E1),
            offset: Offset(2, 8),
            blurRadius: 23,
            spreadRadius: 23,
          ),
        ],
      ),
      child: Center(
          child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Icon(Icons.navigate_before, size: 30),
          ),
          kText(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          Spacer(),
          Visibility(
            visible: title.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Icon(Icons.tune),
            ),
          )
        ],
      )),
    ),
  );
}

PreferredSize kDetailsAppBar({
  required Size size,
  required BuildContext context,
  required DetailsController currentController,
}) {
  return PreferredSize(
    preferredSize: Size(size.width.w, 70.h),
    child: Container(
      height: 70.h,
      width: size.width.w,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFF8E1),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFFF8E1),
            offset: Offset(2, 8),
            blurRadius: 23,
            spreadRadius: 23,
          ),
        ],
      ),
      child: Center(
          child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              onTapDown: (details) async {
                currentController.handleTap(details);
                currentController.state.isPopped.value = true;
                currentController.update();
                await Future.delayed(1.seconds);
                Get.back();
              },
              child: Icon(Icons.navigate_before, size: 30),
            ),
          ),
        ],
      )),
    ),
  );
}
