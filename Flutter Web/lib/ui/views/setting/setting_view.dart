import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/button/button.dart';
import '../../widgets/common/mytextfield/mytextfield.dart';
import 'setting_viewmodel.dart';

class SettingView extends StackedView<SettingViewModel> {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const SettingView({Key? key, this.data}) : super(key: key);

  @override
  void onViewModelReady(SettingViewModel viewModel) {
    viewModel.namectrl.text = data['Name'] ?? " ";
    viewModel.passctrl.text = data['password'] ?? " ";
    viewModel.conpassctrl.text = data['ConfirmPassword'] ?? " ";
    viewModel.emailctrl.text = data['Email'] ?? " ";
    viewModel.phonectrl.text = data['Phone'] ?? " ";
    viewModel.id = data['id'] ?? " ";

    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SettingViewModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceMedium,
          const Padding(
            padding: EdgeInsets.only(left: 450),
            child: Text(
              "Update Profile",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 250),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name"),
                    verticalSpaceSmall,
                    Mytextfield(
                      value: 8.0,
                      title: "Name",
                      ctrl: viewModel.namectrl,
                      textfiledwidth: quarterScreenWidth(context),
                      prefix: const Icon(
                        Icons.person,
                        size: 16,
                      ),
                    ),
                    verticalSpaceMedium,
                    const Text("Email"),
                    verticalSpaceSmall,
                    Mytextfield(
                      title: "Email",
                      ctrl: viewModel.emailctrl,
                      textfiledwidth: quarterScreenWidth(context),
                      value: 8.0,
                      prefix: const Icon(
                        Icons.email,
                        size: 16,
                      ),
                    ),
                    verticalSpaceMedium,
                    const Text("Phone"),
                    verticalSpaceSmall,
                    Mytextfield(
                      textfiledwidth: quarterScreenWidth(context),
                      value: 8.0,
                      title: "Phone",
                      ctrl: viewModel.phonectrl,
                      prefix: const Icon(
                        Icons.phone,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                horizontalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Password"),
                      verticalSpaceSmall,
                      Mytextfield(
                        value: 8.0,
                        title: "Password",
                        ctrl: viewModel.passctrl,
                        textfiledwidth: quarterScreenWidth(context),
                        prefix: const Icon(
                          Icons.password,
                          size: 16,
                        ),
                      ),
                      verticalSpaceMedium,
                      // Confirm Password Text Field
                      const Text("Confirm Password"),
                      verticalSpaceSmall,
                      Mytextfield(
                        value: 8.0,
                        title: "Confirm Password",
                        textfiledwidth: quarterScreenWidth(context),
                        ctrl: viewModel.conpassctrl,
                        prefix: const Icon(
                          Icons.password,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 250),
            child: Button(
              textColor: kcVeryLightGrey,
              title: "Update",
              Color: kcPrimaryColor,
              loading: viewModel.isBusy,
              height: screenHeight(context) * 0.06,
              width: thirdScreenWidth(context) * 0.7,
              onTap: () async {
                viewModel.saveUserinformation(viewModel.id);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  SettingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingViewModel();
}
