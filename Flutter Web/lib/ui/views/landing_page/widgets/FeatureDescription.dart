import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import '../../../common/app_strings.dart';
import '../landing_page_viewmodel.dart';
import 'Feature card.dart';

class FeatureDescription extends ViewModelWidget<LandingPageViewModel> {
  const FeatureDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    LandingPageViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceLarge,
        const Padding(
          padding: EdgeInsets.only(left: 370),
          child: Text(
            "Features",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: kcpurpleColor,
            ),
          ),
        ),
        verticalSpaceMedium,
        Text(halfFeatureHeading),
        verticalSpaceSmall,
        Text(fullFeatureHeading),
        verticalSpaceMedium,
        Row(
          children: [
            Featurecard(
                img: feature1,
                title: "Seamless Audio Upload",
                dec:
                    "  Our platform offers a user-friendly\n  experience   where   you  can \n  effortlessly upload your audio\n  files."),
            horizontalSpaceMedium,
            Featurecard(
                img: video,
                title: "Seamless Video Upload",
                dec:
                    "  Discover our platform's seamless\n  experience   for   effortlessly\n  uploading your video files."),
            horizontalSpaceMedium,
            Featurecard(
                img: feature3,
                title: "Clear Topic Visualization",
                dec:
                    " Once your audio is processed, our\n website  presents  the  extracted \n topics in a clear  and  organized \n manner making it easy for you to \n grasp the key discussion points."),
            horizontalSpaceMedium,
            Featurecard(
                img: feature4,
                title: "Effortless Export to Excel",
                dec:
                    "   Take control of your data with the \n   option  to export the extracted \n   topics directly  to an Excel (.xls) \n   file This feature simplifies your\n   workflow and allows for  convenient\n   data management."),
          ],
        )
      ],
    );
  }
}
