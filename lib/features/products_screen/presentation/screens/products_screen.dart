import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/error_indicator.dart';
import 'package:ecommerce_app/core/widget/loading_indicator.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_states.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {


    final categoryId = ModalRoute.of(context)!.settings.arguments as String? ?? '';
    return Scaffold(
      appBar: const HomeScreenAppBar(
          automaticallyImplyLeading: true
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            Expanded(
              child: BlocProvider(
                create: (_) => serviceLocator.get<ProductsCubit>()..getProducts(categoryId: categoryId),
                child: BlocBuilder<ProductsCubit, ProductsStates>(
                  builder: (context, state) {
                    if(state is GetProductLoading){
                      return const LoadingIndicator();
                    }else if(state is GetProductError){
                      return ErrorIndicator(message: state.message);
                    }else if(state is GetProductSuccess){

                      if(state.products.isEmpty) {
                        return const Center(
                          child: Text('No products found'),
                        );
                      }

                      return GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 9,
                        ),
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return CustomProductWidget(product: product,);
                        },
                        scrollDirection: Axis.vertical,
                      );
                    } else {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}