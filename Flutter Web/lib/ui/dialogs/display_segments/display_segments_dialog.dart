import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

import '../../common/app_colors.dart';
import 'display_segments_dialog_model.dart';

class DisplaySegmentsDialog extends StackedView<DisplaySegmentsDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DisplaySegmentsDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DisplaySegmentsDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceMassive,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Segments:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
            if (request.data['segment'] != null)
              for (int i = 0; i < request.data['segment']!.length; i++)
                Text(
                  'Segment ${i + 1}:\n${request.data['segment']![i].replaceAll('            ', '')}', //RegExp(r'\s+'),'      ')}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
          ],
        ),
      ),
    );
  }

  @override
  DisplaySegmentsDialogModel viewModelBuilder(BuildContext context) =>
      DisplaySegmentsDialogModel(request.data['segment']);
}
