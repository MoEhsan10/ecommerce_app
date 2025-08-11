import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatefulWidget {
  final int initialValue;
  final void Function(int) onIncrement;
  final void Function(int) onDecrement;

  const ProductCounter({
    super.key,
    this.initialValue = 1,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (counter > 1) {
                setState(() {
                  counter--;
                });
                widget.onDecrement(counter);
              }
            },
            child: Icon(
              Icons.remove_circle_outline,
              size: 20.w,
              color: ColorManager.white,
            ),
          ),
          SizedBox(width: 18.w),
          Text(
            '$counter',
            style: getMediumStyle(color: ColorManager.white)
                .copyWith(fontSize: 18.sp),
          ),
          SizedBox(width: 18.w),
          InkWell(
            onTap: () {
              setState(() {
                counter++;
              });
              widget.onIncrement(counter);
            },
            child: Icon(
              Icons.add_circle_outline,
              color: ColorManager.white,
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}