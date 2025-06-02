import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

Widget customesidebar(IconData icon, String label) {
  return Row(
    children: [
      Icon(icon), horizontalSpaceSmall, 
    Text(label)
    ],
  );
}
