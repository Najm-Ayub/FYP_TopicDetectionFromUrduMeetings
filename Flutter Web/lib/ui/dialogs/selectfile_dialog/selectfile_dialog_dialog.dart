import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../widgets/common/button/button.dart';
import 'selectfile_dialog_dialog_model.dart';

class SelectfileDialogDialog extends StackedView<SelectfileDialogDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SelectfileDialogDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SelectfileDialogDialogModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy
        ? const SpinKitFadingCircle(
            size: 50,
            color: kcsliderColor,
          )
        : Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 200,
                width: 400,
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Keeps the dialog content compact
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpaceMedium,
                    const Text(
                      'Are you sure you want to upload this file?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(request.title!),
                          horizontalSpaceMedium,
                          Text(request.description! + " Mb"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 160, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            textColor: kcVeryLightGrey,
                            title: 'Upload File',
                            height: screenHeight(context) * 0.04,
                            Color: kcsliderColor,
                            width: quarterScreenWidth(context) * 0.3,
                            onTap: () {
                              viewModel.uploadata(context);
                            },
                          ),
                          horizontalSpaceSmall,
                          Button(
                            textColor: kcVeryLightGrey,
                            title: 'Cancel',
                            height: screenHeight(context) * 0.04,
                            Color:
                                kcsliderColor, // You can define a kcRedColor in app_colors.dart
                            width: quarterScreenWidth(context) * 0.3,
                            onTap: () {
                              completer(DialogResponse(confirmed: true));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  @override
  SelectfileDialogDialogModel viewModelBuilder(BuildContext context) =>
      SelectfileDialogDialogModel(
          request.data['fileBytes'],
          request.data['fileName'],
          request.data['sizeInMb'],
          request.data['extractedlist'],
          request.data['onDataChanged'],
          request.data['Projectname']);
}
