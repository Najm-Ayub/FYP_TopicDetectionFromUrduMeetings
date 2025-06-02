import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

Widget contactwidget(
  IconData icon,
  String address,
) {
  return Column(children: [Icon(icon), verticalSpaceSmall, Text(address)]);
}
