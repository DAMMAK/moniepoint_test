import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spring/spring.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';

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
      // physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          20.verticalSpace,
          Spring.slide(
            springController: springController,
            slideType: SlideType.slide_in_bottom,
            animDuration: Duration(milliseconds: 1000),
            curve: Curves.linear,
            delay: Duration(milliseconds: 400),
            cutomTweenOffset: Tween(begin: Offset(0, 50.h), end: Offset(0, 0)),
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
            animDuration: Duration(milliseconds: 1000),
            curve: Curves.linear,
            delay: Duration(milliseconds: 400),
            cutomTweenOffset: Tween(begin: Offset(0, 50.h), end: Offset(0, 0)),
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
            animDuration: Duration(milliseconds: 1000),
            curve: Curves.linear,
            delay: Duration(milliseconds: 400),
            cutomTweenOffset: Tween(begin: Offset(0, 50.h), end: Offset(0, 0)),
            extend: 30,
            withFade: true,
            child: itemWidget(
                item1: "Condition",
                value1: "New",
                item2: "Weight",
                value2: "200g"),
          ),
          20.verticalSpace,
          Divider(
            color: Colors.grey,
          ),
          20.verticalSpace,
          descriptionWidget(),
        ],
      ),
    );
  }

  Widget itemWidget(
      {required String item1,
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
              .map((e) => Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Row(
                      children: [
                        Container(
                          height: 4.h,
                          width: 4.w,
                          decoration: BoxDecoration(
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
      ],
    );
  }
}
