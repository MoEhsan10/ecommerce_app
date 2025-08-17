import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce_app/features/products_screen/domain/entitiy/product.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/product_counter.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _productsCubit = serviceLocator.get<ProductsCubit>();

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          product.title,
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child: BlocProvider(
            create: (context) => _productsCubit,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ProductSlider(
                  items: product.imagesURLs
                      .map((imageURL) => ProductItem(imageUrl: imageURL))
                      .toList(),
                  initialIndex: 0),
              SizedBox(
                height: 24.h,
              ),
              ProductLabel(
                  productName: product.title,
                  productPrice:
                      'EGP ${product.priceAfterDiscount ?? product.price}'),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: ProductRating(
                      productBuyers: '${product.ratingsQuantity}',
                      productRating:
                          '${product.ratingsAverage} (${product.ratingsQuantity})',
                    ),
                  ),
                  ProductCounter(
                    initialValue: _productsCubit.productQuantity,
                    onIncrement: _productsCubit.onQuantityChanged,
                    onDecrement: _productsCubit.onQuantityChanged,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              ProductDescription(productDescription: product.description),
              ProductSize(
                size: const [35, 38, 39, 40],
                onSelected: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              Text('Color',
                  style: getMediumStyle(color: ColorManager.appBarTitleColor)
                      .copyWith(fontSize: 18.sp)),
              ProductColor(color: const [
                Colors.red,
                Colors.blueAccent,
                Colors.green,
                Colors.yellow,
              ], onSelected: () {}),
              SizedBox(
                height: 48.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: getMediumStyle(
                                color: ColorManager.primary.withOpacity(.6))
                            .copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      BlocBuilder<ProductsCubit, ProductsStates>(
                          builder: (context, state) {
                        return Text(
                            'EGP ${(product.priceAfterDiscount ?? product.price) * _productsCubit.productQuantity}',
                            style: getMediumStyle(
                                    color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp));
                      })
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () => context.read<CartCubit>().addToCart(product.id),
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
