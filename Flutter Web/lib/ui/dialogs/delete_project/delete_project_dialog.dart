import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';

import 'delete_project_dialog_model.dart';

class DeleteProjectDialog extends StackedView<DeleteProjectDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteProjectDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteProjectDialogModel viewModel,
    Widget? child,
  ) {
    return AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: kcsliderColor)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: kcsliderColor),
              ),
              onPressed: () async {
                try {
                  await viewModel.firestore
                      .collection('your_collection_name')
                      .doc(request.title)
                      .delete();

                  completer(DialogResponse(confirmed: true));
                } catch (e) {
                  completer(DialogResponse(confirmed: false));
                }
                //Navigator.of(context).pop();
              })
        ]);
  }

  @override
  DeleteProjectDialogModel viewModelBuilder(BuildContext context) =>
      DeleteProjectDialogModel();
}
