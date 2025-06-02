import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/widgets/common/button/button.dart';

import '../../widgets/common/uploadmeeting/uploadmeeting.dart';
import 'home_page_show_viewmodel.dart';

class HomePageShowView extends StackedView<HomePageShowViewModel> {
  const HomePageShowView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomePageShowViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Expanded(
          child: Image(
            image: AssetImage(backgroundimg),
            width: screenWidth(context) * 0.8975,
            height: screenHeight(context),
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
            left: 40,
            top: 180,
            child: Text("Topic Discussed in \n \t\t\t Meeting",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
        Positioned(
            left: 480,
            top: 100,
            child: SizedBox(
              //height: 200,
              width: 200,
              // color: Colors.black,
              child: Image(
                image: AssetImage(stackimg),
                fit: BoxFit.cover,
              ),
            )),
        Positioned(
            left: 790,
            top: 100,
            child: SizedBox(
                height: 300,
                width: 400,
                child:viewModel.check? const Uploadmeeting():
                 Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Circle radius as per your requirement
                    ),
                    child: Column(
                      children: [
                        verticalSpaceMedium,
                        Image(
                          image: AssetImage(filepic),
                          width: 100,
                          height: 100,
                        ),
                        verticalSpaceMedium,
                        Button(
                          title: "Upload  Meeting",
                          onTap: () {
                            //viewModel.updatevalue();
                            //viewModel.navigateTouploadMeeting();
                          },
                        ),
                        verticalSpaceSmall,
                        const Text("or Drop a file")
                      ],
                    ))))
      ],
    );
  }

  @override
  HomePageShowViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomePageShowViewModel();
}
