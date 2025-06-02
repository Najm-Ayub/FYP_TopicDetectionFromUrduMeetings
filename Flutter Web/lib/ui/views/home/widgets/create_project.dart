import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/home/home_viewmodel.dart';
import 'package:topicdetectionweb/ui/widgets/common/button/button.dart';
import 'package:topicdetectionweb/ui/widgets/common/mytextfield/mytextfield.dart';
import '../../../common/app_colors.dart';

class CreateProject extends ViewModelWidget<HomeViewModel> {
  final String heading;
  const CreateProject({super.key, required this.heading});

  @override
  Widget build(
    BuildContext context,
    HomeViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 400, top:50),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Text(heading,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            verticalSpaceSmall,
            const Text("Title of Project",
                style: TextStyle(
                  fontSize: 16,
                )),
            verticalSpaceSmall,
            Mytextfield(
              title: "Enter the name of your Project",
              textfiledwidth: thirdScreenWidth(context),
              ctrl: viewModel.projectctrl,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Project title is required";
                }
                return null;
              },
              value: 5,
            ),
           verticalSpaceSmall,
            const Text("Description",
                style: TextStyle(
                  fontSize: 16,
                )),
            verticalSpaceSmall,
            Mytextfield(
                maxlines: 9,
                ctrl: viewModel.descriptionctrl,
                value: 5,
                maxcond: true,
                title: "Enter Project Description(optional)",
                textfiledwidth: thirdScreenWidth(context)),
            verticalSpaceSmall,
            Button(
                textColor: kcVeryLightGrey,
                loading: viewModel.isBusy,
                title: "Save",
                Color: kcPrimaryColor,
                height: screenHeight(context) * 0.06,
                width: thirdScreenWidth(context) * 1.0,
                onTap: () async {
                  if (viewModel.formKey.currentState!.validate()) {
                    viewModel.setBusy(true);
                    if (heading == 'Create Project') {
                      viewModel.updatename("Create");
                      viewModel.setcreate(6);
                    } else if (heading == 'Edit Project') {
                      await viewModel.onProceed(11);
                      viewModel.setcreate(7);
                    }
                    viewModel.setBusy(false);
                  }
                })
          ],
        ),
      ),
    );
  }
}
