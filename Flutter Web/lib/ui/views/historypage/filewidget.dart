import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

Widget filedata(
  String data1,
  String data2,
  String data3,
) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(data1),
      horizontalSpaceLarge,
      Text(data2),
      horizontalSpaceLarge,
      Text(data3),
      //horizontalSpaceMedium,.
      horizontalSpaceSmall,
      horizontalSpaceSmall,
      Card(
        color: Color.fromARGB(255, 225, 148, 235),
        child: Row(
          children: [
            Image(
              image: AssetImage(
                delte,
              ),
              width: 10,
              height: 10,
            ),
            Text(
              "Delete",
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      )
    ],
  );
}
