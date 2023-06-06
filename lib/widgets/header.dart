import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideShowsWidget(),
        Padding(
          padding: EdgeInsets.only(top: 60.h, left: 16.w),
          child: TopHeader(),
        ),
      ],
    );
  }
}

class TopHeader extends StatelessWidget {
  const TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.h,
          width: 230.w,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC5C5C9)),
              borderRadius: BorderRadius.circular(8.r)),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search...",
              contentPadding: EdgeInsets.only(left: 20.w, top: 5.h),
            ),
          ),
        ),
        16.horizontalSpace,
        HeaderIconWidget(imgUrl: "assets/images/bag.png", itemCount: "1"),
        20.horizontalSpace,
        HeaderIconWidget(imgUrl: "assets/images/text.png", itemCount: "9+")
      ],
    );
  }
}

class HeaderIconWidget extends StatelessWidget {
  final String imgUrl;
  final String itemCount;

  const HeaderIconWidget(
      {Key? key, required this.imgUrl, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imgUrl,
          height: 25.h,
          width: 25.h,
          fit: BoxFit.scaleDown,
        ),
        Transform.translate(
          offset: Offset(10.w, -5.h),
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
                color: Color(0xffE55986),
                borderRadius: BorderRadius.circular(5.r)),
            child: Center(
                child: TextView(
              text: itemCount,
              color: Colors.white,
              fontSize: 9.sp,
            )),
          ),
        )
      ],
    );
  }
}

class SlideShowsWidget extends StatefulWidget {
  const SlideShowsWidget({Key? key}) : super(key: key);

  @override
  State<SlideShowsWidget> createState() => _SlideShowsWidgetState();
}

class _SlideShowsWidgetState extends State<SlideShowsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.h,
      child: PageView(
        children: [
          Stack(
            children: [
              Container(
                height: 310.h,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      110.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.verticalSpace,
                          TextView(
                            text: "#FASHION DAY",
                            fontSize: 11.sp,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w800,
                          ),
                          5.verticalSpace,
                          TextView(
                            text: "80% OFF",
                            fontSize: 28.sp,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w800,
                          ),
                          5.verticalSpace,
                          SizedBox(
                            width: 170.w,
                            child: TextView(
                              text: "Discover fashion that suit to your style",
                              fontSize: 11.sp,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.normal,
                              lineHeight: 1.4,
                            ),
                          ),
                          25.verticalSpace,
                          Container(
                            height: 40.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                color: AppColor.textColor,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Center(
                              child: TextView(
                                text: "Check this out",
                                fontSize: 11.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/store1.png",
                  height: 250.h,
                  width: 170.w,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                height: 310.h,
                width: double.infinity,
                color: Colors.pinkAccent.withOpacity(0.17),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      110.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          30.verticalSpace,
                          TextView(
                            text: "#BEAUTYSALE",
                            fontSize: 11.sp,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w800,
                          ),
                          6.verticalSpace,
                          TextView(
                            text: "DISCOVER OUR\nBEAUTY COLLECTION",
                            fontSize: 16.sp,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w800,
                            lineHeight: 1.5,
                          ),
                          25.verticalSpace,
                          Container(
                            height: 40.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                color: AppColor.textColor,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Center(
                              child: TextView(
                                text: "Check this out",
                                fontSize: 11.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/store2.png",
                  height: 250.h,
                  width: 170.w,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
