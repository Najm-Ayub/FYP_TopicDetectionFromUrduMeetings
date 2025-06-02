import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/home/home_viewmodel.dart';
import 'package:topicdetectionweb/ui/widgets/common/button/button.dart';
import '../../../common/app_colors.dart';

class Uploadfile extends ViewModelWidget<HomeViewModel> {
  final String projectname;
  const Uploadfile({super.key, required this.projectname});

  @override
  Widget build(
    BuildContext context,
    HomeViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 230,
      ),
      child: Column(
        children: [
          verticalSpaceLarge,
          SizedBox(
            height: 50,
            width: 200,
            child: Text(
              projectname,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 400,
            width: thirdScreenWidth(context) * 1.7,
            child: Card(
              elevation: 2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 10),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Text(
                              "Project Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(children: [
                              Button(
                                textColor: kcVeryLightGrey,
                                title: "Select File",
                                loading: viewModel.isBusy,
                                height: screenHeight(context) * 0.04,
                                Color: kcsliderColor,
                                width: quarterScreenWidth(context) * 0.4,
                                onTap: () {
                                  viewModel.filePick(context);
                                },
                              ),
                              horizontalSpaceSmall,
                              Button(
                                textColor: kcVeryLightGrey,
                                title: "Save",
                                loading: viewModel.loading,
                                height: screenHeight(context) * 0.04,
                                Color: kcsliderColor,
                                width: quarterScreenWidth(context) * 0.4,
                                onTap: () async {
                                  viewModel.setloadingvalue(true);
                                  //viewModel.fetchData();
                                  await viewModel.onProceed(10);
                                  viewModel.setloadingvalue(false);
                                  viewModel.setcreate(7);
                                },
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          //horizontalSpaceLarge,
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: Text(
                              "FileName",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 180),
                            child: Text(
                              "Size",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 180),
                            child: Text(
                              "Actions",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    viewModel.extractedList.isNotEmpty
                        ? ListView.builder(
                            itemCount: viewModel.extractedList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 80),
                                    child: SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: Text(viewModel.extractedList[index]
                                          ["fileName"]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: Text(viewModel.extractedList[index]
                                                  ["size"]
                                              .toStringAsFixed(2) +
                                          " Mb"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 90, bottom: 30),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            viewModel.deleteFile(index);
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: kcPrimaryColor,
                                            size: 20,
                                          ),
                                        ),
                                       horizontalSpaceSmall,
                                        // GestureDetector(
                                        //   onTap: () async {
                                        //     try {
                                        //       final urduTextLines = viewModel
                                        //           .extractedList[index]
                                        //               ["urduText"]
                                        //           .split('۔')
                                        //           .join('\n\n');

                                             
                                             
                                        //       List<String> segments =
                                        //           await viewModel.segment
                                        //               .tokenizeText(
                                        //                   urduTextLines);
                                        //       //   .tokenizeTextFileFromAssets();
                                        //       log(
                                        //         "segments are----$segments",
                                        //       );

                                        //    // Display each segment with a new heading

                                        //       viewModel.updateSegment(segments);
                                        //       viewModel.displaySegment();
                                        //       List<dynamic> summaries =
                                        //           await viewModel.displayTopic
                                        //               .getSummaries(viewModel
                                        //                   .displayedSegments);
                                        //       print("summries are $summaries");
                                        //       viewModel
                                        //           .updateSummaries(summaries);
                                        //       viewModel.onProceed(index);
                                        //     } catch (e) {
                                        //       log('Error: $e');
                                        //     }
                                        //   },
                                        //   child: const Tooltip(
                                        //       message: "Display Segments",
                                        //       child: Icon(
                                        //         Icons.view_array,
                                        //         color: kcPrimaryColor,
                                        //       )),
                                        // ),
                                        // horizontalSpaceSmall,
                                        GestureDetector(
                                            onTap: () {
                                              viewModel.displayDialog(
                                                  viewModel.extractedList[index]
                                                      ["urduText"],
                                                  viewModel.extractedList[index]
                                                      ["fileName"]);
                                            },
                                            child: const Tooltip(
                                              message: "Display Urdu Text",
                                              child: Icon(
                                                Icons.display_settings,
                                                color: kcPrimaryColor,
                                              ),
                                            )),
                                        horizontalSpaceSmall,
                                        GestureDetector(
                                            onTap:() async {
                                              log("projectName is ${viewModel.projectctrl.text}");
                                              log(viewModel.summaryList["Meating$index"].toString());
                                              log("==================================");

                                              //  await viewModel.fetchData(viewModel.extractedList[index]);

                                              // viewModel.topics(index+1);
                                              // Map<String, dynamic> summaryData =
                                              //     viewModel
                                              //         .firestoreData[index];
                                              viewModel.displaysummary(viewModel.summaryList["Meating$index"],viewModel.extractedList[index]
                                                      ["urduText"],);
                                            },
                                            child: const Tooltip(
                                              message: "Display Topic",
                                              child: Icon(
                                                Icons.smart_display,
                                                color: kcPrimaryColor,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : SizedBox(
                            height: thirdScreenWidth(context) * 0.4,
                            child: const Center(
                              child: Text(
                                "No File Uploaded So Far",
                                style: TextStyle(
                                  color: kcLightGrey,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
