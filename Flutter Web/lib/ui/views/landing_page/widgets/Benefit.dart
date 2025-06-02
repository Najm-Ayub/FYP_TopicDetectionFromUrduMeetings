// ignore: file_names
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import '../landing_page_viewmodel.dart';

class Benefit extends ViewModelWidget<LandingPageViewModel> {
  final String benefit1;
  final String benefit2;
  final String benefit3;
  final String benefit4;
  const Benefit({
    Key? key,
    required this.benefit1,
    required this.benefit2,
    required this.benefit3,
    required this.benefit4,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    LandingPageViewModel viewModel,
  ) {
    return Column(
      children: [
        Row(
          children: [
            viewModel.tickMark(),
            horizontalSpaceSmall,
            Text(benefit1),
            horizontalSpaceLarge,
            viewModel.tickMark(),
            horizontalSpaceSmall,
            Text(benefit2),
          ],
        ),
        verticalSpaceLarge,
        Row(
          children: [
            horizontalSpaceTiny,
            horizontalSpaceTiny,
            viewModel.tickMark(),
            horizontalSpaceSmall,
            Text(benefit3),
            horizontalSpaceSmall,
            horizontalSpaceTiny,
            viewModel.tickMark(),
            horizontalSpaceSmall,
            Text(benefit4),
          ],
        ),
      ],
    );
  }
}
