import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

import '../landing_page_viewmodel.dart';

class Introduction extends ViewModelWidget<LandingPageViewModel> {
  const Introduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    LandingPageViewModel viewModel,
  ) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMedium,
        Text(
          "Our project is centered on a meeting topic detection system that excels in identifying key discussion points from uploaded",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        verticalSpaceSmall,
        Text(
            "files.Our primary objective is to provide users with an effortless platform for uploading meeting materials where our system,",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify),
        verticalSpaceSmall,
        Text(
            "automatically detects and presents the primary topics found within them.With our solution,you can efficiently streamline the",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify),
        verticalSpaceSmall,
        Text(
            "analysis of meeting content and rapidly extract vital subjects for consideration.Join us in revolutionizing the way meetings",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify),
        verticalSpaceSmall,
        Text("are managed and topics are unveiled!",
            style: TextStyle(fontSize: 16), textAlign: TextAlign.justify),
        verticalSpaceSmall,
      ],
    );
  }
}
