import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import '../home/home_viewmodel.dart';
import 'dashborad_viewmodel.dart';

class DashboradView extends StackedView<DashboradViewModel> {
  final HomeViewModel homeViewModel;

  const DashboradView({Key? key, required this.homeViewModel})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboradViewModel viewModel,
    Widget? child,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Center(
        child: Padding(
          padding: EdgeInsets.only(left: 230, top: 50),
          child: Text(
            "DashBoard",
            style: TextStyle(
                color: kcsliderColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      verticalSpaceMedium,
      Padding(
        padding: const EdgeInsets.only(left: 300),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: hoverColor1,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        homeViewModel.setcreate(4);
                      },
                      child: SvgPicture.asset(
                        createProject,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    verticalSpaceMedium,
                    const Text(
                      "Create Projects",
                      style: TextStyle(fontSize: 20, color: kcsliderColor),
                    )
                  ],
                ),
              ),
            ),
            horizontalSpaceLarge,
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: hoverColor1,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpaceSmall,
                    InkWell(
                      onTap: () {
                        homeViewModel.setcreate(7);
                      },
                      child: SvgPicture.asset(
                        viewProject,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    verticalSpaceMedium,
                    const Text(
                      "View Projects",
                      style: TextStyle(fontSize: 20, color: kcsliderColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //verticalSpaceMedium,
      const Padding(
        padding: EdgeInsets.only(left: 280, top: 50),
        child: Text(
          "Meeting Information",
          style: TextStyle(
              color: kcsliderColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 330, top: 50),
        child: Row(
          children: [
            Text("Language",
                style: TextStyle(fontSize: 16, color: kcsliderColor)),
            horizontalSpaceMedium,
            Text("Minimum Limit",
                style: TextStyle(fontSize: 16, color: kcsliderColor)),
            horizontalSpaceMedium,
            Text("Maximum Limit",
                style: TextStyle(fontSize: 16, color: kcsliderColor)),
            horizontalSpaceMedium,
            Text("Supported Format",
                style: TextStyle(fontSize: 16, color: kcsliderColor))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 270, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("URDU",
                style: TextStyle(fontSize: 16, color: kcDarkGreyColor)),
            horizontalSpaceLarge,
            const Text("15 minutes",
                style: TextStyle(fontSize: 16, color: kcDarkGreyColor)),
            horizontalSpaceLarge,
            horizontalSpaceTiny,
            const Text("60 minutes",
                style: TextStyle(fontSize: 16, color: kcDarkGreyColor)),
            horizontalSpaceLarge,
            horizontalSpaceTiny,
            DropdownButton<String>(
              items: [
                'flac',
                'mp4',
                'wav',
                '.acc',
                'aiff',
                'mp3',
                'flv',
                'mkv',
                'mov',
                'webm',
                'm4v',
                'mpeg',
                'HEVC'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black)),
                );
              }).toList(),
              onChanged: (String? newValue) {},
              value: 'flac',
            )
          ],
        ),
      ),
    ]);
  }

  @override
  DashboradViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboradViewModel();
}
