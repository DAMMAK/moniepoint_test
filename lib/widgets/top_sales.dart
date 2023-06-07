import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teamapt/models/product.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';
import 'package:teamapt/widgets/fade_route.dart';

import 'product_details.dart';

class TopSalesProduct extends StatelessWidget {
  const TopSalesProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:
          EdgeInsets.only(top: 20.h, bottom: 150.h, right: 16.w, left: 16.w),
      sliver: SliverGrid.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 0.78),
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
              product: products[index],
            );
          }),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isLiked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          FadeRoute(
              page: ProductDetails(
            product: widget.product,
          )),
        );
      },
      child: Container(
        width: 155.w,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    width: 155.w,
                    height: 120.h,
                    color: Color(0xffF0F0F0),
                    child: Image.asset(
                      widget.product.imgUrl,
                      height: 90.h,
                      width: 120.w,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  right: 6.w,
                  top: 7.w,
                  child: SvgPicture.asset(
                      "assets/images/${widget.product.isLiked ? "filled_heart.svg" : "heart.svg"}"),
                )
              ],
            ),
            5.verticalSpace,
            TextView(
              text: widget.product.category,
              fontSize: 10.sp,
              color: Color(0xffC2C2C6),
            ),
            5.verticalSpace,
            TextView(
              text: widget.product.name,
              fontWeight: FontWeight.bold,
              lineHeight: 1.4,
              fontSize: 11.sp,
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 15.sp,
                      color: Color(0xffF9A23B),
                    ),
                    5.horizontalSpace,
                    TextView(
                      text: "${widget.product.rating}",
                      fontSize: 10.sp,
                      color: Color(0xffC2C2C6),
                      fontWeight: FontWeight.w500,
                    ),
                    5.horizontalSpace,
                    Container(
                      height: 8.h,
                      width: 1.w,
                      color: Color(0xffC2C2C6),
                    ),
                    5.horizontalSpace,
                    TextView(
                      text: "${widget.product.salesCount}",
                      fontSize: 10.sp,
                      color: Color(0xffC2C2C6),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                TextView(
                  text: "\$${widget.product.price}",
                  fontSize: 15.sp,
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
