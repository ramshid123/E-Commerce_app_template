import 'package:e_commerce_ux/models/product_model.dart';
import 'package:e_commerce_ux/pages/details_page/controller.dart';
import 'package:e_commerce_ux/pages/home_page/controller.dart';
import 'package:e_commerce_ux/shared/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget kQuantityCounter() {
  return Container(
    height: 40.h,
    width: 120.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: Colors.black)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove),
        ),
        kText(
          text: '1',
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
      ],
    ),
  );
}

Widget kBottomBar(
    {required Size size,
    required ProductModel product,
    required DetailsController currentController,
    required HomeController homeController}) {
  return GetBuilder(
      init: currentController,
      builder: (controller) {
        return Container(
          height: 70.h,
          width: size.width.w,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(2, -8),
                blurRadius: 23,
                spreadRadius: 23,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.favorite_outline),
              GestureDetector(
                onTapDown: (detail) async {
                  currentController.handleTap(detail);
                  product.tag = product.tag.contains('cart_')
                      ? product.tag
                      : 'cart_' + product.tag;
                  homeController.update();
                  currentController.update();
                  currentController.state.isPopped.value = true;
                  await Future.delayed(1.seconds);
                  Get.back();
                },
                child: Container(
                  height: 50.h,
                  width: 230.w,
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: Center(
                    child: kText(
                      text: 'Add to cart',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
