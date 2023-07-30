import 'package:e_commerce_ux/models/product_model.dart';
import 'package:e_commerce_ux/pages/details_page/details_index.dart';
import 'package:e_commerce_ux/pages/details_page/view.dart';
import 'package:e_commerce_ux/pages/home_page/home_index.dart';
import 'package:e_commerce_ux/routes/names.dart';
import 'package:e_commerce_ux/shared/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

Widget kItemCard(
    {required BuildContext context,
    required ProductModel product,
    required HomeController controller}) {
  return GetBuilder(
      init: controller,
      builder: (controller) {
        return GestureDetector(
          onTapUp: (details) async {
            controller.handleTap(details);
            await Future.delayed(500.milliseconds);
            await Get.to(
              () => DetailsPage(),
              arguments: {'product': product, 'controller': controller},
              binding: DetailsBinding(),
              routeName: ApprouteNames.detailsPage,
              duration: 1.seconds,
              transition: Transition.fade,
            );
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
                padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                height: 250.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                height: 250.h,
                width: 250.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: product.tag.contains('cart_')
                            ? product.tag.substring(5)
                            : product.tag,
                        child: Image.network(
                          product.imageUrl,
                          height: 100.h,
                          width: 100.w,
                        ),
                      ),
                    ),
                    kHeight(10.h),
                    kText(
                      text: '\$${product.price}',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                    ),
                    kHeight(10.h),
                    kText(
                      text: product.name,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                    ),
                    kHeight(10.h),
                    kText(
                      text: product.quantity,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      maxLines: 2,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
