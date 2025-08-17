import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/error_indicator.dart';
import 'package:ecommerce_app/core/widget/loading_indicator.dart';
import 'package:ecommerce_app/core/widget/ui_utils.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late final CartCubit _cartCubit = context.read<CartCubit>();

  @override
  void initState() {
    super.initState();
    _cartCubit.getCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: BlocConsumer<CartCubit,CartState>(
          listener: (_, state) {
            if(state is UpdateCartLoading || state is DeleteFromCartLoading){
              UIUtils.showLoading(context);
            }else if(state is UpdateCartError){
              UIUtils.hideLoading(context);
              UIUtils.showMessage(context, state.message);
            }else if(state is DeleteFromCartError){
              UIUtils.hideLoading(context);
              UIUtils.showMessage(context, state.message);
            }else if(state is UpdateCartSuccess || state is DeleteFromCartSuccess){
              UIUtils.hideLoading(context);
            }
          },
            builder:(context, state) {
              if(state is GetCartLoading){
                return const LoadingIndicator();
              }else if(state is GetCartError){
                return ErrorIndicator(message: state.message);
              }else {
                // Check if cart is empty
                if(_cartCubit.cart.cartItems.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined, size: 100, color: ColorManager.primary),
                        const SizedBox(height: 16),
                         Text('Your cart is empty', style: getLightStyle(color: ColorManager.textColor ) ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      // the list of cart items ===============
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            CartItemWidget(
                              cartItemData: _cartCubit.cart.cartItems[index],
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: AppSize.s12.h),
                        itemCount: _cartCubit.cart.cartItems.length,
                      ),
                    ),
                    // the total price and checkout button========
                    TotalPriceAndCheckoutBotton(
                      totalPrice: _cartCubit.cart.totalCartPrice,
                      checkoutButtonOnTap: () {},
                    ),
                    SizedBox(height: 10.h),
                  ],
                );
              }
            }
        ),
      ),
    );
  }
}
