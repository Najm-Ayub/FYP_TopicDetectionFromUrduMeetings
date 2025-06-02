import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'info_alert_dialog_model.dart';

class InfoAlertDialog extends StackedView<InfoAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InfoAlertDialogModel viewModel,
    Widget? child,
  ) {
    // String title = request.description!;
    // String formattedText = title.replaceAll('\n', '');
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: kcsliderColor,
                          ),
                          onPressed: () {
                            viewModel.setzoomIN();
                          },
                        ),
                      ),
                      horizontalSpaceSmall,
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: kcsliderColor,
                        ),
                        onPressed: () {
                          viewModel.setzoomOut();
                        },
                      ),
                      horizontalSpaceSmall,
                      TextButton(
                        onPressed: () {
                          viewModel.copyToClipboard(request.description!);
                          viewModel.toastService
                              .toastmessage("copy sucessfull");
                        },
                        child: const Icon(Icons.copy, color: kcsliderColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 350),
                        child: Text(
                          request.title!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kcsliderColor),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          completer(DialogResponse(confirmed: true));
                        },
                        child: const Icon(
                          Icons.close,
                          color: kcsliderColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  GestureDetector(
                    onScaleUpdate: (details) {
                      viewModel.setscale(details.scale);
                    },
                    onScaleEnd: (details) {
                      viewModel.previousScale = viewModel.scale;
                    },
                    child: Transform.scale(
                      scale: viewModel.scale,
                      child: Text(request.description!.replaceAll('۔', '\n\n'),
                          style: const TextStyle(
                            fontFamily: 'NotoNastaliqUrdu',
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }

  @override
  InfoAlertDialogModel viewModelBuilder(BuildContext context) =>
      InfoAlertDialogModel();
}
