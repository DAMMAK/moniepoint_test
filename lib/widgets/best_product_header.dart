import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';

class BestProductHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60.0;

  @override
  double get maxExtent => 60.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: "Best Sale Product",
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            TextButton(
              onPressed: () {},
              child: TextView(
                text: "See More",
                fontSize: 12.sp,
                color: AppColor.secondaryColor,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(BestProductHeaderDelegate oldDelegate) => false;
}
