import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import '../../../common/app_colors.dart';
import 'sidebarx_widget_model.dart';

class SidebarxWidget extends StackedView<SidebarxWidgetModel> {
  const SidebarxWidget({super.key, required this.controller});
  final SidebarXController controller;

  @override
  Widget builder(
    BuildContext context,
    SidebarxWidgetModel viewModel,
    Widget? child,
  ) {
    return SidebarX(
      headerBuilder: (context, extended) {
        return Padding(
            padding: const EdgeInsets.only(top: 30), child: Container());
      },
      controller: controller,
      theme:  const SidebarXTheme(
        textStyle: TextStyle(color:kcVeryLightGrey ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 202, 161, 248),
            
          ),
         
       
          iconTheme: IconThemeData(color: Colors.white)),
      items: const [
        SidebarXItem(
          label: "DashBoard",
          icon: Icons.home,
          
        
        ),
        SidebarXItem(icon: Icons.settings, label: "Update Profile",
      
        ),
        SidebarXItem(icon: Icons.lock, label: "Privacy Policy"),
        SidebarXItem(icon: Icons.logout, label: "Logout"),
      ],
      extendedTheme: const SidebarXTheme(width: 140),
    );
  }

  @override
  SidebarxWidgetModel viewModelBuilder(
    BuildContext context,
  ) =>
      SidebarxWidgetModel();
}
