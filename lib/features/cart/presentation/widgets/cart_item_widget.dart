import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/product_counter.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart_item_data.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartItemData
  });

  final CartItemData cartItemData;



  // final String imagePath;
  // final String title;
  // final Color color;
  // final String colorName;
  // final int size;
  // final int price;
  // final void Function() onDeleteTap;
  // final int quantity;
  // final void Function(int value) onIncrementTap;
  // final void Function(int value) onDecrementTap;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final cartCubit = context.read<CartCubit>();
    return Container(
      height: isPortrait ? height * 0.14 : width * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
      ),
      child: Row(children: [
        // display image in the container
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
          ),
          child: CachedNetworkImage(
           imageUrl: cartItemData.product.imageCoverURL,
            fit: BoxFit.cover,
            height: isPortrait ? height * 0.142 : height * 0.23,
            width: isPortrait ? width * 0.29 : 165.w,
          ),
        ),
        // SizedBox(width: 8.w),
        // display details product=========================
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p8.w,
              vertical: AppPadding.p8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // title and delete button ==
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        cartItemData.product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.textColor,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => cartCubit.deleteFromCart(cartItemData.product.id),
                      child: Image.asset(
                        IconsAssets.icDelete,
                        color: ColorManager.textColor,
                        height: 22.h,
                      ),
                    )
                  ],
                ),

                // SizedBox(height: 7.h),
                const Spacer(),
                // display color and size===================
                // ColorAndSizeCartItem(
                //   color: ColorManager.primary,
                //   colorName: 'blue',
                //   size: 10,
                // ),
                const Spacer(),

                // display price and quantity =================
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP ${cartItemData.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp),
                      ),
                    ),
                    ProductCounter(
                      initialValue: cartItemData.count,
                      onIncrement: (quantity) => cartCubit.updateCart(cartItemData.product.id, quantity),
                      onDecrement: (quantity) => cartCubit.updateCart(cartItemData.product.id, quantity),
                    ),
                  ],
                ),

              ],
            ),
          ),
        )
      ]),
    );
  }
}
