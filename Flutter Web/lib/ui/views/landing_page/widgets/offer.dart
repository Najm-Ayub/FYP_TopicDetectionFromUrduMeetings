import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/landing_page/widgets/offerlist.dart';

import '../../../common/app_strings.dart';

Widget offer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      verticalSpaceMedium,

      const Text(
        "Our mission is to simplify your life by offering an innovative solution that effortlessly extracts key topics from your meeting",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
      verticalSpaceSmall, //style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 40),),
      const Text(
        "audio files We understand the challenges of managing and comprehending lengthy discussions.",
        style: TextStyle(fontSize: 16),
      ),
      //textAlign: TextAlign.center),
      verticalSpaceSmall,
      const Text("Discover the future of efficient meeting analysis today!",
          style: TextStyle(fontSize: 16), textAlign: TextAlign.justify),
      verticalSpaceLarge,
      Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          offerlist(growimg, "GROW",
              "Increase your sales by gaining valuable \n insights from the discussed topics."),
          horizontalSpaceLarge,
          horizontalSpaceLarge,
          offerlist(nlpimg, "NLP MODEL",
              "Let NLP technology work for you\n in uncovering relevant topics."),
          horizontalSpaceLarge,
          horizontalSpaceLarge,
          offerlist(exportimg, "EXPORT",
              "Effortlessly export your extracted \n topics to a .xls file."),
        ],
      ),
    ],
  );
}
