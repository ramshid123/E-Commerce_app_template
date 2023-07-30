import 'package:e_commerce_ux/pages/home_page/home_index.dart';
import 'package:e_commerce_ux/shared/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget CartPage({required Size size, required HomeController controller}) {
  return Obx(() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: size.height.h,
          width: size.width.w,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            children: [
              kHeight(20.h),
              SizedBox(
                child: GetBuilder(
                    init: controller,
                    builder: (controller) {
                      return Row(
                        children: [
                          kWidth(20.w),
                          kText(
                            text: 'Cart',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                          kWidth(10.w),
                          SizedBox(
                              width: 165.w,
                              height: 40.h,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: controller.state.groceryItems
                                      .where(
                                          (item) => item.tag.contains('cart_'))
                                      .toList()
                                      .length,
                                  itemBuilder: (context, index) {
                                    final product = controller
                                        .state.groceryItems
                                        .where((item) =>
                                            item.tag.contains('cart_'))
                                        .toList()[index];
                                    return Hero(
                                      tag: product.tag,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 5.w),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        height: 40.h,
                                        width: 40.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                          child: Image.network(
                                            product.imageUrl,
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                          Spacer(),
                          CircleAvatar(
                            radius: 23.r,
                            backgroundColor: Colors.amber[200],
                            child: kText(
                                text: controller.state.groceryItems
                                    .where((item) => item.tag.contains('cart_'))
                                    .toList()
                                    .length
                                    .toString(),
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                          ),
                          kWidth(20.w),
                        ],
                      );
                    }),
              )
                  .animate(target: controller.state.isDraggedUp.value ? 0 : 1)
                  .fadeIn(
                      delay: 500.ms, curve: Curves.easeInOut, duration: 500.ms),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight(10.h),
                    kText(
                      text: 'Cart',
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                    kHeight(40.h),
                    Column(
                      children: [
                        // for (int i = 0; i < 3; i++)
                        SizedBox(
                          height: 200.h,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.state.groceryItems
                                .where((item) => item.tag.contains('cart_'))
                                .toList()
                                .length,
                            itemBuilder: (context, index) {
                              final product = controller.state.groceryItems
                                  .where((item) => item.tag.contains('cart_'))
                                  .toList()[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25.r,
                                      child: Image.network(product.imageUrl),
                                    ),
                                    kWidth(15.w),
                                    SizedBox(
                                      width: 37.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          kText(
                                            text: '1',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                          kText(
                                            text: '  X',
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                    kWidth(15.w),
                                    SizedBox(
                                      width: 157.w,
                                      child: kText(
                                        text: product.name,
                                        fontSize: 14,
                                        color: Colors.white,
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 56.w,
                                      child: kText(
                                        text: '\$${product.price}',
                                        color: Colors.blueGrey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        kHeight(10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25.r,
                              backgroundColor: Colors.blueGrey[900],
                              child: Icon(
                                Icons.local_shipping_outlined,
                                color: Colors.amber[200],
                              ),
                            ),
                            kWidth(20.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kHeight(10.h),
                                kText(
                                  text: 'Delivery',
                                  fontSize: 14,
                                  color: Colors.white,
                                  maxLines: 2,
                                ),
                                kHeight(10.h),
                                SizedBox(
                                  width: 180.w,
                                  child: kText(
                                    text:
                                        'All orders of \$40 or more qualify for FREE delivery.',
                                    color: Colors.blueGrey,
                                    fontSize: 13,
                                  ),
                                ),
                                kHeight(15.h),
                                Container(
                                  height: 5.h,
                                  width: 160.w,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[900],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      height: 5.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: Colors.amber[200],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
                  .animate(target: controller.state.isDraggedUp.value ? 1 : 0)
                  .moveY(
                      begin: 200, duration: 1500.ms, curve: Curves.easeInOut),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          width: size.width.w,
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  kText(
                    text: 'Total',
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                  kText(
                    text: '\$43.00',
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              kHeight(20.h),
              Container(
                height: 50.h,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: kText(
                    text: 'Continue',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              kHeight(10.h),
            ],
          ),
        )
            .animate(target: controller.state.isDraggedUp.value ? 1 : 0)
            .fadeIn(delay: 500.ms, curve: Curves.easeInOut, duration: 500.ms)
      ],
    );
  });
}
