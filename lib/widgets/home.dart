import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'best_product_header.dart';
import 'category_widget.dart';
import 'header.dart';
import 'top_sales.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            shadowColor: Colors.grey.withOpacity(0.2),
            collapsedHeight: 80.h,
            backgroundColor: Colors.white,
            flexibleSpace: const FlexibleSpaceBar(
              background: HeaderWidget(),
            ),
            pinned: true,
            title: const TopHeader(color: Colors.orange, showShadow: true),
          ),
          const SliverToBoxAdapter(
            child: ShoppingCategoryWidget(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: BestProductHeaderDelegate(),
          ),
          const TopSalesProduct()
        ],
      ),
    );
  }
}
