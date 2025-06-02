import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/contactus/contactwidget.dart';
import 'package:topicdetectionweb/ui/widgets/common/button/button.dart';
import 'package:topicdetectionweb/ui/widgets/common/mytextfield/mytextfield.dart';

import 'contactus_viewmodel.dart';

class ContactusView extends StackedView<ContactusViewModel> {
  const ContactusView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    ContactusViewModel viewModel,
    Widget? child,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 200),
          child:
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          const Text(
                "Contact us",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          verticalSpaceSmall,
                          const Text(
                "Get in touch with us",
                          ),
                          verticalSpaceLarge,
                          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  contactwidget(Icons.location_on, "123,city,lahore"),
                  horizontalSpaceMedium,
                  contactwidget(Icons.email, "2020cs653@student.uet.edu.pk"),
                  horizontalSpaceMedium,
                  contactwidget(Icons.phone, "+9234567899"),
                ],
                          ),
                          verticalSpaceLarge,
                          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 330),
                    child: Text("Email"),
                  ),
                  verticalSpaceSmall,
                  Mytextfield(
                    title: "example@gmail.com",
                    ctrl: viewModel.mailctrl,
                    textfiledwidth: quarterScreenWidth(context),
                    value: 8.0,
                  ),
                  verticalSpaceSmall,
                  const Text("phone"),
                  verticalSpaceSmall,
                  Mytextfield(
                    title: "12345678",
                    textfiledwidth: quarterScreenWidth(context),
                    ctrl: viewModel.phonectrl,
                    value: 8.0,
                  ),
                 verticalSpaceMedium,
                  Button(
                    textColor: kcVeryLightGrey,
                    Color: kcPrimaryColor,
                    height: screenHeight(context) * 0.06,
                    width: thirdScreenWidth(context) * 0.7,
                    title: "Submit",
                    onTap: () {},
                  )
                ],
                          ),
                          horizontalSpaceLarge,
                        ]),
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(Contact),
                width: 400,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  ContactusViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactusViewModel();
}
