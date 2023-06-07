import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spring/spring.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';

class ReviewsWidget extends StatelessWidget {
  ReviewsWidget({Key? key}) : super(key: key);
  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            child: ratingReviews()),
        30.verticalSpace,
        reviewImages(),
        30.verticalSpace,
        Divider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1.8,
        ),
        20.verticalSpace,
        topReview(),
      ],
    );
  }

  Widget reviewImages() {
    var height = 75.h;
    var width = 75.w;
    var margin = EdgeInsets.only(right: 10.w);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: "Reviews with images & videos",
          fontSize: 14.sp,
          color: AppColor.textColor,
          fontWeight: FontWeight.w800,
        ),
        30.verticalSpace,
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  "assets/images/product1.png",
                  height: height,
                  width: width,
                ),
                margin: margin),
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset("assets/images/product2.png",
                    height: height, width: width),
                margin: margin),
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset("assets/images/product2.png",
                    height: height, width: width),
                margin: margin),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.asset(
                "assets/images/product2.png",
                height: height,
                width: width,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget topReview() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "Top Reviews",
                  fontSize: 15.sp,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w800,
                ),
                10.verticalSpace,
                TextView(
                  text: "Showing 3 of 2.3k+ reviews",
                  fontSize: 13.sp,
                  color: Colors.grey.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Container(
              height: 50.h,
              width: 120.w,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300.withOpacity(0.2),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(7.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    text: "Popular",
                    fontSize: 12.sp,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w800,
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded)
                ],
              ),
            )
          ],
        ),
        ...List.generate(
            4,
            (index) => Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: _userReviews(),
                ))
      ],
    );
  }

  Widget _userReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Image.asset(
                    "assets/images/user1.jpg",
                    height: 40.h,
                    width: 40.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                10.horizontalSpace,
                TextView(
                  text: "Eren Y***r",
                  fontSize: 12.sp,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20.sp,
                  color: const Color(0xffF9A23B),
                ),
                TextView(
                  text: "5.0",
                  fontSize: 14.sp,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
          ],
        ),
        20.verticalSpace,
        Row(
            children: [
          "Product in good condition",
          "Very fasr delivery",
          "Fast seller response"
        ].map((e) => _reviewItemCategory(e)).toList()),
        20.verticalSpace,
        TextView(
          text: "According to my expectations. This is the best.\n Thank you.",
          fontSize: 12.sp,
          color: AppColor.textColor,
          fontWeight: FontWeight.w800,
          lineHeight: 1.8,
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.thumb_up,
                  color: AppColor.secondaryColor,
                ),
                20.horizontalSpace,
                TextView(
                  text: "Helpful ?",
                  fontSize: 12.sp,
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.w800,
                  lineHeight: 1.8,
                ),
              ],
            ),
            TextView(
              text: "Yesterday",
              fontSize: 12.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              lineHeight: 1.8,
            ),
          ],
        ),
        30.verticalSpace,
        Divider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1.8,
        ),
      ],
    );
  }

  Widget _reviewItemCategory(String text) {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(right: 5.w),
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ),
      decoration: BoxDecoration(
          color: AppColor.secondaryColor.withOpacity(0.2),
          border: Border.all(color: AppColor.secondaryColor, width: 0.9),
          borderRadius: BorderRadius.circular(20.r)),
      child: Center(
        child: TextView(
          text: text,
          fontSize: 9.1.sp,
          color: AppColor.secondaryColor,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget ratingReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: "Review & Ratings",
          fontSize: 12.sp,
          color: AppColor.textColor,
          fontWeight: FontWeight.w800,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                15.verticalSpace,
                Row(
                  children: [
                    TextView(
                      text: "4.9",
                      fontSize: 35.sp,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w800,
                    ),
                    Transform.translate(
                      offset: Offset(0, 5.h),
                      child: TextView(
                        text: "/ 5.0",
                        fontSize: 12.sp,
                        color: Colors.grey.withOpacity(0.9),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20.sp,
                      color: const Color(0xffF9A23B),
                    ),
                    Icon(
                      Icons.star,
                      size: 20.sp,
                      color: const Color(0xffF9A23B),
                    ),
                    Icon(
                      Icons.star,
                      size: 20.sp,
                      color: const Color(0xffF9A23B),
                    ),
                    Icon(
                      Icons.star,
                      size: 20.sp,
                      color: const Color(0xffF9A23B),
                    ),
                    Icon(
                      Icons.star,
                      size: 20.sp,
                      color: const Color(0xffF9A23B),
                    ),
                  ],
                ),
                30.verticalSpace,
                TextView(
                  text: "2.3k+ Reviews",
                  fontSize: 13.sp,
                  color: Colors.grey.withOpacity(0.9),
                  fontWeight: FontWeight.normal,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                _reviewItem(5, "1.5k"),
                _reviewItem(4, "710"),
                _reviewItem(3, "140"),
                _reviewItem(2, "10"),
                _reviewItem(1, "4")
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _reviewItem(int count, String result) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(
            Icons.star,
            size: 20.sp,
            color: const Color(0xffF9A23B),
          ),
          10.horizontalSpace,
          TextView(
            text: "$count",
            fontSize: 13.sp,
            color: Colors.grey.withOpacity(0.9),
            fontWeight: FontWeight.normal,
          ),
          15.horizontalSpace,
          linerLine(count: count),
          15.horizontalSpace,
          TextView(
            text: result,
            fontSize: 13.sp,
            color: AppColor.textColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget linerLine({int count = 1}) {
    var width = 120;
    return Stack(
      children: [
        Container(
          height: 10.h,
          width: width.w,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5.r)),
        ),
        Container(
          height: 10.h,
          width: ((width / 5) * count).w,
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(5.r)),
        )
      ],
    );
  }
}
