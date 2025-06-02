import 'package:flutter/widgets.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

Widget offerlist(String img, String title, String desc) {
  return Column(
    children: [
      Image(image: AssetImage(img), width: 100, height: 100),
      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      verticalSpaceSmall,
      Text(
        desc,
        style: TextStyle(fontSize: 10),
      )
    ],
  );
}
