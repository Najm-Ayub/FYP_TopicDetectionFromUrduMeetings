import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import '../landing_page_viewmodel.dart';

class Featurecard extends ViewModelWidget<LandingPageViewModel> {
  final String img;
  final String title;
  final String dec;
  const Featurecard({
    Key? key,
    required this.img,
    required this.title,
    required this.dec,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    LandingPageViewModel viewModel,
  ) {
    return SizedBox(
      height: 240,
      width: 200,
      child: Card(
        elevation: 10,
        color: kcfeatureColor,
        child: Column(
          children: [
            verticalSpaceSmall,
            Image(
              image: AssetImage(img),
              width: 100,
              height: 100,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                dec,
                style: const TextStyle(fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
