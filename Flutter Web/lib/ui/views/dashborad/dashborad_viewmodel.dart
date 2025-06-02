import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';

class DashboradViewModel extends BaseViewModel {
  Color? color1;
  Color? color2;
  double? elevations;
  final controller = SidebarXController(selectedIndex: 0, extended: true);

  void setcontainer1(Color color, double elevation) {
    color1 = color;
    elevations = elevation;
    notifyListeners();
  }

  void setcontainer2(Color color, double elevation) {
    color2 = color;
    elevations = elevation;
    notifyListeners();
  }
}
