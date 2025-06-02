import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_strings.dart';
import '../../../common/ui_helpers.dart';
import '../button/button.dart';
import 'uploadmeeting_model.dart';

class Uploadmeeting extends StackedView<UploadmeetingModel> {
  const Uploadmeeting({super.key});

  @override
  Widget builder(
    BuildContext context,
    UploadmeetingModel viewModel,
    Widget? child,
  ) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30.0), // Circle radius as per your requirement
        ),
        child: Column(
          children: [
            verticalSpaceMedium,
            const Text("Your file uploading"),
            verticalSpaceMedium,
            const Text(
              "39%",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            verticalSpaceMedium,
            Center(
              child: Container(
                //color: Colors.amber,
                //height: 35,
                width: 200,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.file_open,
                      size: 20,
                    ),
                    horizontalSpaceMedium,
                    const Text(
                      "Meeting with laiba.mp3",
                      style: TextStyle(fontSize: 10),
                    ),
                    horizontalSpaceMedium,
                    Image(
                      image: AssetImage(cancelicon),
                      width: 15,
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
            verticalSpaceMedium,
            Button(
              title: "Upload  Meeting",
              onTap: () {},
            ),
            verticalSpaceSmall,
            const Text("or Drop a file")
          ],
        ));
  }

  @override
  UploadmeetingModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadmeetingModel();
}
