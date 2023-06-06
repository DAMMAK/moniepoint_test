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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        10.verticalSpace,
        Row(
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
        10.verticalSpace,
        // Expanded(
        //   child: GridView.count(
        //     physics: NeverScrollableScrollPhysics(),
        //     padding: EdgeInsets.zero,
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 20.w,
        //     mainAxisSpacing: 1.0,
        //     childAspectRatio: 0.72,
        //     children: List.generate(products.length, (index) {
        //       return ProductItem(
        //         product: products[index],
        //       );
        //     }),
        //   ),
        // )
        Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: products
                .asMap()
                .map((key, value) {
                  return MapEntry(
                      key,
                      Padding(
                        padding: EdgeInsets.only(
                            left: (key + 1) % 2 == 0 ? 25.w : 0.w),
                        child: ProductItem(
                          product: value,
                        ),
                      ));
                })
                .values
                .toList())
      ]),
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
