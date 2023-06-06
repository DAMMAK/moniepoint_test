import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spring/spring.dart';
import 'package:teamapt/models/product.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';

import 'header.dart';
import 'tab_content.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/images/heart.svg",
                                height: 25.h,
                                width: 25.w,
                                fit: BoxFit.fill,
                              )),
                          25.horizontalSpace,
                          Image.asset(
                            "assets/images/share.png",
                            height: 25.h,
                            width: 25.w,
                            fit: BoxFit.scaleDown,
                          ),
                          25.horizontalSpace,
                          const HeaderIconWidget(
                            itemCount: "1",
                            imgUrl: 'assets/images/bag.png',
                          )
                        ],
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Spring.slide(
                    springController: springController,
                    slideType: SlideType.slide_in_bottom,
                    animDuration: Duration(milliseconds: 1000),
                    curve: Curves.linear,
                    // delay: Duration(milliseconds: 4000),
                    cutomTweenOffset:
                        Tween(begin: Offset(0, 50.h), end: Offset(0, 0)),
                    extend: 30,
                    withFade: true,
                    child: Stack(
                      children: [
                        Container(
                          height: 350.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Image.asset(
                            widget.product.imgUrl,
                            width: 70.w,
                            height: 250.h,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          left: 15.w,
                          top: 20.h,
                          child: verticalImage(),
                        ),
                      ],
                    ),
                  ),
                  Spring.slide(
                    springController: springController,
                    slideType: SlideType.slide_in_bottom,
                    animDuration: Duration(milliseconds: 1000),
                    curve: Curves.linear,
                    delay: Duration(milliseconds: 500),
                    cutomTweenOffset:
                        Tween(begin: Offset(0, 50.h), end: Offset(0, 0)),
                    extend: 30,
                    withFade: true,
                    child: Column(
                      children: [
                        15.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/shop.svg"),
                            8.horizontalSpace,
                            TextView(
                              text: "Tokunbo",
                              fontSize: 11.sp,
                              color: Color(0xffC2C2C6),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        TextView(
                          text: widget.product.name,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        15.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20.sp,
                              color: const Color(0xffF9A23B),
                            ),
                            5.horizontalSpace,
                            TextView(
                              text: "${widget.product.rating} Ratings",
                              fontSize: 13.sp,
                              color: const Color(0xffC2C2C6),
                              fontWeight: FontWeight.w700,
                            ),
                            15.horizontalSpace,
                            Container(
                              height: 5.h,
                              width: 4.w,
                              decoration: const BoxDecoration(
                                color: Color(0xffC2C2C6),
                                shape: BoxShape.circle,
                              ),
                            ),
                            15.horizontalSpace,
                            TextView(
                              text: "${widget.product.salesCount} Reviews",
                              fontSize: 13.sp,
                              color: const Color(0xffC2C2C6),
                              fontWeight: FontWeight.w500,
                            ),
                            15.horizontalSpace,
                            Container(
                              height: 5.h,
                              width: 4.w,
                              decoration: const BoxDecoration(
                                color: Color(0xffC2C2C6),
                                shape: BoxShape.circle,
                              ),
                            ),
                            15.horizontalSpace,
                            TextView(
                              text: "2.9k + Sold",
                              fontSize: 13.sp,
                              color: const Color(0xffC2C2C6),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Spring.slide(
                          springController: springController,
                          slideType: SlideType.slide_in_bottom,
                          animDuration: Duration(milliseconds: 1000),
                          curve: Curves.linear,
                          delay: Duration(milliseconds: 400),
                          cutomTweenOffset:
                              Tween(begin: Offset(0, 50.h), end: Offset(0, 0)),
                          extend: 30,
                          withFade: true,
                          child: ProductDetailsTab()))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Spring.slide(
              springController: springController,
              slideType: SlideType.slide_in_bottom,
              animDuration: Duration(milliseconds: 1000),
              curve: Curves.linear,
              delay: Duration(milliseconds: 400),
              cutomTweenOffset:
                  Tween(begin: Offset(0, 50.h), end: Offset(0, 0)),
              extend: 30,
              withFade: true,
              child: Container(
                height: 100.h,
                width: 375.w,
                padding: EdgeInsets.only(left: 25.w, right: 10.w, top: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: "Total Price",
                          fontSize: 10.sp,
                          color: const Color(0xffC2C2C6),
                          fontWeight: FontWeight.w700,
                        ),
                        7.verticalSpace,
                        TextView(
                          text: "\$18.00",
                          fontSize: 20.sp,
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: AppColor.secondaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/bag.png",
                                color: Colors.white,
                                height: 20.h,
                                width: 20.w,
                                fit: BoxFit.scaleDown,
                              ),
                              5.horizontalSpace,
                              TextView(
                                text: "1",
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: AppColor.textColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.r),
                                bottomRight: Radius.circular(5.r)),
                          ),
                          child: Center(
                            child: TextView(
                              text: "Buy Now",
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget verticalImage() {
    return Column(
      children: List.generate(
        4,
        (index) => Container(
          height: 40.h,
          width: 40.w,
          margin: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.35),
              borderRadius: BorderRadius.circular(5.r)),
          child: Image.asset(
            "assets/images/product${index + 1}.png",
            height: 50.h,
            width: 50.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
