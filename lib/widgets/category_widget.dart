import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';

class ShoppingCategoryWidget extends StatelessWidget {
  const ShoppingCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      20.verticalSpace,
      Padding(
        padding: EdgeInsets.only(right: 25.w, left: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            categoryItem(imgUrl: 'category_wg7b6u.svg', name: 'Category'),
            categoryItem(imgUrl: 'flight_ze8awo.svg', name: 'Flight'),
            categoryItem(imgUrl: 'receipt_x8t6ed.svg', name: 'Bill'),
            categoryItem(imgUrl: 'global_twzt8l.svg', name: 'Data Plan'),
            categoryItem(imgUrl: 'coin_cat.svg', name: 'Top Up'),
          ],
        ),
      ),
      20.verticalSpace,
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 3.h,
          width: 10.w,
          decoration: BoxDecoration(
              color: AppColor.textColor,
              borderRadius: BorderRadius.circular(10.r)),
        ),
        3.horizontalSpace,
        Container(
          height: 3.3.h,
          width: 3.3.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        3.horizontalSpace,
        Container(
          height: 3.3.h,
          width: 3.3.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.5),
          ),
        )
      ])
    ]);
  }

  Widget categoryItem({required String imgUrl, required String name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(5.r)),
          child: SvgPicture.asset(
            "assets/images/$imgUrl",
            height: 20.h,
            width: 20.w,
          ),
        ),
        10.verticalSpace,
        TextView(
          text: name,
          fontSize: 10.sp,
          color: const Color(0xffC2C2C6),
          fontWeight: FontWeight.normal,
        )
      ],
    );
  }
}
