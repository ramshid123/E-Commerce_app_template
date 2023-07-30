import 'package:e_commerce_ux/models/product_model.dart';
import 'package:e_commerce_ux/pages/details_page/widgets.dart';
import 'package:e_commerce_ux/pages/home_page/controller.dart';
import 'package:e_commerce_ux/pages/home_page/widgets.dart';
import 'package:e_commerce_ux/shared/common/app_bar.dart';
import 'package:e_commerce_ux/shared/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'details_index.dart';

class DetailsPage extends GetView<DetailsController> {
  DetailsPage({super.key});

  ProductModel product = Get.arguments['product'];
  HomeController homeController = Get.arguments['controller'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              controller.state.isPopped.value = true;
              controller.update();
              await Future.delayed(1000.ms);
              Get.back();
              return false;
            },
            child: GestureDetector(
              onTapDown: controller.handleTap,
              child: Stack(
                children: [
                  Scaffold(
                    appBar: kDetailsAppBar(
                        size: size,
                        context: context,
                        currentController: controller),
                    body: GetBuilder(
                        init: controller,
                        builder: (controller) {
                          return Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Hero(
                                tag: product.tag + '_container',
                                child: Container(
                                  height: size.height,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    height: size.height.h - 280.h,
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Hero(
                                              tag: product.tag,
                                              child: Image.network(
                                                product.imageUrl,
                                                height: 230.h,
                                                width: 230.w,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          kHeight(15.h),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              kText(
                                                text: product.name,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              kHeight(10.h),
                                              kText(
                                                text: product.quantity,
                                                fontSize: 14,
                                                color: Colors.blueGrey,
                                              ),
                                              kHeight(30.h),
                                              Row(
                                                children: [
                                                  kQuantityCounter(),
                                                  Spacer(),
                                                  kText(
                                                    text: '\$${product.price}',
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ],
                                              ),
                                              kHeight(30.h),
                                              kText(
                                                text: 'About the product',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              kHeight(15.h),
                                              kText(
                                                text: product.description,
                                                fontSize: 14,
                                                maxLines: 50,
                                              )
                                            ],
                                          )
                                              .animate()
                                              .fadeIn(
                                                  delay: 500.ms,
                                                  duration: 1000.ms,
                                                  curve: Curves.easeInOut)
                                              .moveY(
                                                  begin: -30.h,
                                                  delay: 500.ms,
                                                  duration: 1000.ms,
                                                  curve: Curves.easeInOut)
                                              .animate(
                                                  target: controller
                                                          .state.isPopped.value
                                                      ? 1
                                                      : 0)
                                              .fadeOut(
                                                  duration: 1000.ms,
                                                  curve: Curves.easeInOut)
                                              .moveY(
                                                  end: -30.h,
                                                  duration: 1000.ms,
                                                  curve: Curves.easeInOut),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              kBottomBar(
                                      size: size,
                                      product: product,
                                      homeController: homeController,
                                      currentController: controller)
                                  .animate()
                                  .fadeIn(
                                      delay: 500.ms,
                                      duration: 1000.ms,
                                      curve: Curves.easeInOut)
                                  .moveY(
                                      begin: -30.h,
                                      delay: 500.ms,
                                      duration: 1000.ms,
                                      curve: Curves.easeInOut)
                                  .animate(
                                      target: controller.state.isPopped.value
                                          ? 1
                                          : 0)
                                  .fadeOut(
                                      duration: 1000.ms,
                                      curve: Curves.easeInOut)
                                  .moveY(
                                      end: -30.h,
                                      duration: 1000.ms,
                                      curve: Curves.easeInOut),
                            ],
                          );
                        }),
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
        });
  }
}

final maggieDesc =
    """Maggie noodles, also known as Maggi noodles, are a popular brand of instant noodles that originated in Switzerland in the late 19th century. The brand is now owned by Nestlé and is widely consumed worldwide.

Maggie noodles are known for their convenience and quick preparation time. They come in a variety of flavors, including masala, chicken, vegetable, and more, catering to different taste preferences. The noodles are typically sold in small rectangular packets that contain pre-cooked, dried noodles and a packet of flavoring or seasoning, often in the form of a powdered spice mix.

To prepare Maggie noodles, you simply need to boil the noodles in water, then mix in the seasoning provided. The result is a flavorful and easy-to-prepare dish that has gained immense popularity, especially among college students and people seeking a quick meal solution.

Though Maggie noodles are enjoyed by many, they have also faced occasional controversies in some regions due to concerns about certain ingredients or the nutritional content of instant noodles. As with any processed food, it's essential to consume them in moderation and as part of a balanced diet.""";
