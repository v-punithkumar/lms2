import 'package:eschool/ui/styles/colors.dart';
import 'package:eschool/utils/uiUtils.dart';
import 'package:flutter/material.dart';

class CustomShimmerContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  const CustomShimmerContainer(
      {Key? key, this.height, this.width, this.borderRadius, this.margin,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: height ?? UiUtils.shimmerLoadingContainerDefaultHeight,
      decoration: BoxDecoration(
          color: shimmerContentColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),),
    );
  }
}
