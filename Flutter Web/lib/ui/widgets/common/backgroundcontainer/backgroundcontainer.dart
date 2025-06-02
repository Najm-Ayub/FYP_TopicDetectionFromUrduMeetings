import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';
import 'backgroundcontainer_model.dart';

class Backgroundcontainer extends StackedView<BackgroundcontainerModel> {
  const Backgroundcontainer({super.key});

  @override
  Widget builder(
    BuildContext context,
    BackgroundcontainerModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: screenHeight(context) * 0.8,
      width: screenWidth(context) * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kcVeryLightGrey.withOpacity(0.5),
      ),
    );
  }

  @override
  BackgroundcontainerModel viewModelBuilder(
    BuildContext context,
  ) =>
      BackgroundcontainerModel();
}
