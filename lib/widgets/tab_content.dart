import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamapt/shared/utils/color.dart';

import 'about_item.dart';

class ProductDetailsTab extends StatefulWidget {
  const ProductDetailsTab({Key? key}) : super(key: key);

  @override
  State<ProductDetailsTab> createState() => _ProductDetailsTabState();
}

class _ProductDetailsTabState extends State<ProductDetailsTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2820.h,
      child: Column(
        children: [
          10.verticalSpace,
          TabBar(
            controller: _tabController,
            indicatorColor: AppColor.secondaryColor,
            indicatorWeight: 2.4,
            labelColor: AppColor.secondaryColor,
            labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            unselectedLabelColor: AppColor.textColor.withOpacity(0.8),
            tabs: [
              SizedBox(
                width: 100.w,
                child: Tab(text: "About Item"),
              ),
              Tab(text: "Reviews"),
            ],
          ),
          Expanded(
              child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              ProductDetailAboutItem(),
              Container(height: 300.h),
            ],
          )),
        ],
      ),
    );
  }
}
