import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'button_model.dart';

class Button extends StackedView<ButtonModel> {
  final String? title;
  final VoidCallback? onTap;
  final bool loading;
  final double width;
  final double height;
  final Color;
  final textColor;
  const Button({
    super.key,
    this.title,
    this.onTap,
    this.loading = false,
    required this.textColor,
    required this.Color,
    required this.width,
    required this.height,
  });

  @override
  Widget builder(
    BuildContext context,
    ButtonModel viewModel,
    Widget? child,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Color,
        ),
        child: Center(
          child: loading
              ? const SpinKitFadingCircle(
                  // Use the SpinKitWave spinner
                  color: Colors.white,
                  size: 30.0,
                )
              : Text(
                  title!,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  ButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      ButtonModel();
}
