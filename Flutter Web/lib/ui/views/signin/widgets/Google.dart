import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

import '../signin_viewmodel.dart';

class Googlebutton extends ViewModelWidget<SigninViewModel> {
  final String iconPath;
  final String title;
  final double height;
  final VoidCallback onTap;
  const Googlebutton(
      {Key? key,
      required this.title,
      required this.height,
      required this.iconPath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
    SigninViewModel viewModel,
  ) {
    return InkWell(
      onTap: viewModel.handleGoogleSignIn,
      child: Container(
        height: height,
        width: quarterScreenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: kcMediumGrey),
        ),
        child: Row(
          children: [
            horizontalSpaceLarge,
            SvgPicture.asset(
              iconPath,
              width: 20.0,
              height: 20.0,
            ),
            horizontalSpaceMedium,
            Text(
              title,
              style: const TextStyle(color: kcDarkGreyColor),
            ),
          ],
        ),
      ),
    );
  }
}
