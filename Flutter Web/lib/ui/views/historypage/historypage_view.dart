import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/historypage/filewidget.dart';
import 'package:topicdetectionweb/ui/widgets/common/button/button.dart';

import 'historypage_viewmodel.dart';

class HistorypageView extends StackedView<HistorypageViewModel> {
  const HistorypageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistorypageViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: SizedBox(
            height: screenHeight(context),
            width: screenWidth(context) * 0.82,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "History",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        horizontalSpacemassiveLarge,
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Search by filename",
                              hintStyle: TextStyle(fontSize: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "No",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  horizontalSpaceLarge,
                                  Text(
                                    "Filename",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  horizontalSpaceLarge,
                                  Text(
                                    "Size",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  horizontalSpaceMedium,
                                  Text(
                                    "Action",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              verticalSpaceLarge,
                              filedata(
                                "1",
                                "meeting1",
                                "25MB",
                              ),
                              verticalSpaceMedium,
                              filedata(
                                "2",
                                "meeting2",
                                "50MB",
                              )
                            ],
                          ),
                        )),
                        Spacer(),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, right: 20),
                            child: SizedBox(
                              height: 360,
                              width: thirdScreenWidth(context) * 1.2,
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, left: 10),
                                      child: Text(
                                        "Detected Topics",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 30),
                                      child: ListView.builder(
                                          itemCount: viewModel.data.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Text(index.toString()),
                                                Text(":"),
                                                horizontalSpaceSmall,
                                                Text(viewModel.data[index]),
                                                verticalSpaceMedium
                                              ],
                                            );
                                          }),
                                    ),
                                    verticalSpaceLarge,
                                    verticalSpaceMedium,
                                    verticalSpaceSmall,
                                    Divider(),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 400, bottom: 20),
                                      child: Button(
                                        title: "Export",
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  HistorypageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistorypageViewModel();
}
