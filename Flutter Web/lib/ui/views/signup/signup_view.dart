import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/widgets/common/slider/slider.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/button/button.dart';
import '../../widgets/common/mytextfield/mytextfield.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
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
                    verticalSpaceSmall,
                    const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    verticalSpaceLarge,
                    Mytextfield(
                      value: 8.0,
                      title: "Name",
                      ctrl: viewModel.namectrl,
                      textfiledwidth: quarterScreenWidth(context),
                      prefix: const Icon(
                        Icons.person,
                        size: 16,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Phone is required";
                        }
                        return null;
                      },
                    ),
                    verticalSpaceSmall,
                    Mytextfield(
                      value: 8.0,
                      title: "Password",
                      ctrl: viewModel.passctrl,
                      textfiledwidth: quarterScreenWidth(context),
                      suffix: GestureDetector(
                        onTap: () {
                          viewModel.togglePasswordVisibility();
                        },
                        child: Icon(
                          viewModel.obsecure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: kcPrimaryColor,
                        ),
                      ),
                      obscureText: viewModel.obsecure,
                      prefix: const Icon(
                        Icons.password,
                        size: 16,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
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
                      suffix: GestureDetector(
                        onTap: () {
                          viewModel.togglePasswordVisibility1();
                        },
                        child: Icon(
                          viewModel.obsecure1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: kcPrimaryColor,
                        ),
                      ),
                      obscureText: viewModel.obsecure1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm password is required";
                        }
                        return null;
                      },
                    ),
                    verticalSpaceMedium,
                    Button(
                        textColor: kcVeryLightGrey,
                        title: "Sign up",
                        Color: kcAppbarColor,
                        loading: viewModel.loading,
                        height: screenHeight(context) * 0.06,
                        width: thirdScreenWidth(context) * 0.7,
                        onTap: () async {
                          if (viewModel.formKey.currentState!.validate()) {
                            viewModel.setBusy(true);
                            try {
                              final userCredential = await viewModel.auth
                                  .createUserWithEmailAndPassword(
                                email: viewModel.emailctrl.text.toString(),
                                password: viewModel.passctrl.text.toString(),
                              );
                              final user = userCredential.user;
                              if (user != null) {
                                await user.updateProfile(
                                  displayName:
                                      viewModel.namectrl.text.toString(),
                                );
                              }
                              viewModel.setBusy(false);
                              viewModel.toastService
                                  .toastmessage("Registered Successfully");
                              viewModel.saveUserinformation(user!.uid);

                              viewModel.navigateTOSignin();
                            } catch (error) {
                              viewModel.setBusy(false);
                              viewModel.toastService
                                  .toastmessage(error.toString());
                            }
                            viewModel.setBusy(false);
                          }
                        }),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            viewModel.navigateTOSignin();
                          },
                          child: const Text("Sign in",
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
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
