import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/landing_page/widgets/feature.dart';

Widget feature() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //verticalSpaceMassive,
      verticalSpaceLarge,
      const Text(
        "Features",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.purple,
        ),
      ),
      verticalSpaceMedium,
      const Text(
          "With these features,our website empowers you to efficiently analyze and manage the content of your audio files,"),
      verticalSpaceSmall,
      const Text(
          "enhancing your productivity and understanding of the topics discussed during meetings or conversation"),
      verticalSpaceMedium,
      Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          featurecard(feature1, "Seamless Audio Upload",
              "Our platform offers a user-friendly\nexperience where you can effortlessly\nupload your audio files."),
          horizontalSpaceMedium,
          featurecard(video, "Seamless Video Upload",
              "Discover our platform's seamless experience for effortlessly uploading\nyour video files."),
          horizontalSpaceMedium,
          featurecard(feature3, "Clear Topic Visualization",
              "Once your audio is processed, our\n website presents the extracted topics\nin a clear and organized manner\nmaking it easy for you to grasp the key\ndiscussion points."),
          horizontalSpaceMedium,
          featurecard(feature4, "Effortless Export to Excel",
              "\tTake control of your data with the option\n to export the extracted topics directly\n to an Excel (.xls) file This feature simplifies your workflow and allows for\n convenient data management."),
        ],
      )
    ],
  );
}
