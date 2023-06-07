import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spring/spring.dart';
import 'package:teamapt/models/product.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';
import 'package:teamapt/widgets/reviews.dart';
import 'package:teamapt/widgets/top_sales.dart';

class ProductDetailAboutItem extends StatelessWidget {
  ProductDetailAboutItem({Key? key}) : super(key: key);

  List<String> description = [
    "Long sleeve dress in classic fit featuring button collar",
    "Patch pocket on Left Chest",
    "Durable combination Cotton Fabric",
    "Comfortable and quality dress shirt",
    "Go to classic button down shirt for all special occassions"
  ];

  final SpringController springController =
  SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Spring.slide(
            springController: springController,
            slideType: SlideType.slide_in_bottom,
            animDuration: const Duration(milliseconds: 1000),
            curve: Curves.linear,
            delay: const Duration(milliseconds: 400),
            cutomTweenOffset:
            Tween(begin: Offset(0, 50.h), end: const Offset(0, 0)),
            extend: 30,
            withFade: true,
            child: itemWidget(
                item1: "Brand",
                value1: "Champion",
                item2: "Color",
                value2: "Aqua"),
          ),
          15.verticalSpace,
          Spring.slide(
            springController: springController,
            slideType: SlideType.slide_in_bottom,
            animDuration: const Duration(milliseconds: 1000),
            curve: Curves.linear,
            delay: const Duration(milliseconds: 400),
            cutomTweenOffset:
            Tween(begin: Offset(0, 50.h), end: const Offset(0, 0)),
            extend: 30,
            withFade: true,
            child: itemWidget(
                item1: "Category",
                value1: "Casual Shirt",
                item2: "Material",
                value2: "Polyster"),
          ),
          15.verticalSpace,
          Spring.slide(
            springController: springController,
            slideType: SlideType.slide_in_bottom,
            animDuration: const Duration(milliseconds: 1000),
            curve: Curves.linear,
            delay: const Duration(milliseconds: 400),
            cutomTweenOffset:
            Tween(begin: Offset(0, 50.h), end: const Offset(0, 0)),
            extend: 30,
            withFade: true,
            child: itemWidget(
                item1: "Condition",
                value1: "New",
                item2: "Weight",
                value2: "200g"),
          ),
          20.verticalSpace,
          const Divider(
            color: Colors.grey,
          ),
          20.verticalSpace,
          descriptionWidget(),
          30.verticalSpace,
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1.8,
          ),
          30.verticalSpace,
          shippingInfo(),
          30.verticalSpace,
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1.8,
          ),
          30.verticalSpace,
          sellerInfo(),
          30.verticalSpace,
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1.8,
          ),
          30.verticalSpace,

          ReviewsWidget(),
          30.verticalSpace,

          pagination(),
          60.verticalSpace,
          recommendation()
        ],
      ),
    );
  }

  Widget pagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 15.sp,
              ),
            ),
            10.horizontalSpace,
            TextView(
              text: "1",
              fontSize: 13.sp,
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.w800,
            ),
            20.horizontalSpace,
            TextView(
              text: "2",
              fontSize: 13.sp,
              color: AppColor.textColor.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
            20.horizontalSpace,
            TextView(
              text: "3",
              fontSize: 13.sp,
              color: AppColor.textColor.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
            20.horizontalSpace,
            TextView(
              text: ".....",
              fontSize: 13.sp,
              color: AppColor.textColor.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
            20.horizontalSpace,
            Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade50.withOpacity(0.8),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15.sp,
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextView(
              text: "See more",
              fontSize: 13.sp,
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        )
      ],
    );
  }

  Widget recommendation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: "Recommendation",
              fontSize: 15.sp,
              color: AppColor.textColor,
              fontWeight: FontWeight.w800,
            ),
            TextView(
              text: "See more",
              fontSize: 13.sp,
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductItem(product: products[0]),
            ProductItem(product: products[1])
          ],
        )
      ],
    );
  }


  Widget sellerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: "Seller Information:",
          fontSize: 12.sp,
          color: AppColor.textColor,
          fontWeight: FontWeight.w800,
        ),
        30.verticalSpace,
        Row(
          children: [
            Container(
              // color: Colors.orange,
              height: 85.h,
              width: 85.h,
              child: Stack(
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: TextView(
                        text: "Thrifting\nStore.",
                        fontSize: 12.sp,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12.h,
                    right: 7.w,
                    child: Container(
                      height: 15.h,
                      width: 15.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ),
            15.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "Thrifting Store",
                  fontSize: 17.sp,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w700,
                ),
                10.verticalSpace,
                Row(
                  children: [
                    TextView(
                      text: "Active 5 Min ago",
                      fontSize: 11.sp,
                      color: const Color(0xffC2C2C6),
                    ),
                    5.horizontalSpace,
                    Container(
                      height: 10.h,
                      width: 1.w,
                      color: const Color(0xffC2C2C6),
                    ),
                    5.horizontalSpace,
                    TextView(
                      text: "96% Positive Feedback",
                      fontSize: 11.sp,
                      color: const Color(0xffC2C2C6),
                    ),
                  ],
                ),
                15.verticalSpace,
                Container(
                  height: 40.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: AppColor.secondaryColor, width: 1.6),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/shop.svg",
                        color: AppColor.secondaryColor,
                        height: 16.h,
                        width: 16.w,
                        fit: BoxFit.contain,
                      ),
                      10.horizontalSpace,
                      TextView(
                        text: "Visit store",
                        fontSize: 13.sp,
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget shippingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: "Shipping Information:",
          fontSize: 12.sp,
          color: AppColor.textColor,
          fontWeight: FontWeight.w800,
        ),
        25.verticalSpace,
        _shippingInfoItem(
            key: "Delivery:", value: "Shipping from Jakarta, Indonesia"),
        15.verticalSpace,
        _shippingInfoItem(
            key: "Shipping:", value: "Free International Shipping"),
        15.verticalSpace,
        _shippingInfoItem(
            key: "Arrive:", value: "Estimated arrival on 25-27 Oct 2020"),
      ],
    );
  }

  Widget _shippingInfoItem({required String key, required String value}) {
    return Row(
      children: [
        TextView(
          text: key,
          fontSize: 12.sp,
          color: const Color(0xffC2C2C6),
          fontWeight: FontWeight.w600,
        ),
        20.horizontalSpace,
        TextView(
          text: value,
          fontSize: 12.sp,
          color: AppColor.textColor,
          fontWeight: FontWeight.w800,
        )
      ],
    );
  }

  Widget itemWidget({required String item1,
    required String value1,
    required String item2,
    required String value2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextView(
              text: "$item1:",
              fontSize: 12.sp,
              color: const Color(0xffC2C2C6),
              fontWeight: FontWeight.w600,
            ),
            15.horizontalSpace,
            TextView(
              text: "$value1",
              fontSize: 12.sp,
              color: AppColor.textColor,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        Container(
          // color: Colors.orange,
          width: 150.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextView(
                text: "$item2:",
                fontSize: 12.sp,
                color: const Color(0xffC2C2C6),
                fontWeight: FontWeight.w600,
              ),
              15.horizontalSpace,
              TextView(
                text: "$value2",
                fontSize: 12.sp,
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget descriptionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: "Description",
          fontSize: 12.sp,
          color: AppColor.textColor,
          fontWeight: FontWeight.w600,
        ),
        10.verticalSpace,
        Column(
          children: description
              .map((e) =>
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Row(
                  children: [
                    Container(
                      height: 4.h,
                      width: 4.w,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    10.horizontalSpace,
                    SizedBox(
                      width: 320.w,
                      child: TextView(
                        text: "$e",
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ))
              .toList(),
        ),
        30.verticalSpace,
        TextView(
          text:
          "Chat us if there is anything you need to ask about the product :)",
          fontSize: 12.sp,
          color: Colors.grey,
          fontWeight: FontWeight.normal,
        )
      ],
    );
  }
}
