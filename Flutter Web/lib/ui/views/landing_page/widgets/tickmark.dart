import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

Widget Tickmark() {
  return Container(
    height: 25,
    width: 25,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Color.fromARGB(255, 161, 69, 247),
      //image: DecorationImage(image: AssetImage(Tick))),
    ),
    child: Image(image: AssetImage(Tick)),
  );
}

Widget benifit(String title1, String title2, String title3, String title4) {
  return Column(
    children: [
      Row(
        children: [
          Tickmark(),
          horizontalSpaceSmall,
          Text(title1),
          horizontalSpaceLarge,
          Tickmark(),
          horizontalSpaceSmall,
          Text(title2),
        ],
      ),
      verticalSpaceLarge,
      Row(
        children: [
          horizontalSpaceTiny,
          horizontalSpaceTiny,
          Tickmark(),
          horizontalSpaceSmall,
          Text(title3),
          horizontalSpaceSmall,
          horizontalSpaceTiny,
          Tickmark(),
          horizontalSpaceSmall,
          Text(title4),
        ],
      ),
    ],
  );
}
