import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/signin/widgets/Google.dart';
import 'package:topicdetectionweb/ui/widgets/common/slider/slider.dart';
import '../../common/app_colors.dart';
import '../../widgets/common/button/button.dart';
import '../../widgets/common/mytextfield/mytextfield.dart';
import 'signin_viewmodel.dart';

class SigninView extends StackedView<SigninViewModel> {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SigninViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    verticalSpaceLarge,
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    verticalSpaceLarge,
                    Googlebutton(
                        title: "Continue with Google",
                        height: screenHeight(context) * 0.06,
                        iconPath: googleicon,
                        onTap: () {}),
                    verticalSpaceMedium,
                    const Text("or"),
                    verticalSpaceMedium,
                    Mytextfield(
                      title: "Email",
                      textfiledwidth: quarterScreenWidth(context),
                      value: 8.0,
                      prefix: const Icon(
                        Icons.email,
                        size: 16,
                      ),
                      ctrl: viewModel.emailctrl,
                      validator: (value) {
                        if (viewModel.showEmailValidation && value!.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                    verticalSpaceSmall,
                    Mytextfield(
                      title: "Password",
                      textfiledwidth: quarterScreenWidth(context),
                      value: 8.0,
                      prefix: const Icon(
                        Icons.password,
                        size: 16,
                      ),
                      ctrl: viewModel.passctrl,
                      suffix: GestureDetector(
                        onTap: () {
                          viewModel.togglePasswordVisibility();
                        },
                        child: Icon(
                          viewModel.obsecure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: kcAppbarColor,
                        ),
                      ),
                      obscureText: viewModel.obsecure,
                      validator: (value) {
                        if (viewModel.showPasswordValidation &&
                            value!.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(left: 190.0),
                      child: TextButton(
                          onPressed: () {
                            viewModel.showEmailValidation =
                                true; // Show email validation, hide password validation
                            viewModel.showPasswordValidation = false;
                            if (viewModel.formKey.currentState!.validate()) {
                              viewModel.setBusy(true);

                              viewModel.auth
                                  .sendPasswordResetEmail(
                                      email:
                                          viewModel.emailctrl.text.toString())
                                  .then((value) {
                                viewModel.toastService.toastmessage(
                                    "we have send you email to recover password,please check email");
                              }).onError((error, stackTrace) {
                                viewModel.toastService
                                    .toastmessage(error.toString());
                              });
                              viewModel.setBusy(false);
                            }
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: kcAppbarColor),
                          )),
                    ),
                    verticalSpaceMedium,
                    Button(
                        textColor: kcVeryLightGrey,
                        loading: viewModel.isBusy,
                        title: "Login",
                        Color: kcAppbarColor,
                        height: screenHeight(context) * 0.06,
                        width: thirdScreenWidth(context) * 0.7,
                        onTap: () {
                          if (viewModel.formKey.currentState!.validate()) {
                            viewModel.login();
                          }
                        }),
                    verticalSpaceSmall,
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                        ),
                        TextButton(
                          onPressed: () {
                            viewModel.navigation();
                          },
                          child: const Text("Create one",
                              style: TextStyle(color: kcAppbarColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Sliderwidget()
        ],
      ),
    );
  }

  @override
  SigninViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SigninViewModel();
}
