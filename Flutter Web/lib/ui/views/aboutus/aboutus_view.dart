import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:topicdetectionweb/ui/views/aboutus/widget/card.dart';
import 'aboutus_viewmodel.dart';

class AboutusView extends StackedView<AboutusViewModel> {
  const AboutusView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutusViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About us",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Center(
              //   child: Text(
              //     "About us",
              //     style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              //   ),
              // ),
           
              const Padding(
                padding: EdgeInsets.only(left: 300, right: 300,top: 20),
                child: Text(
                  "We're a dedicated team working on Topic Detection from Urdu Meetings.Our mission extract valuable insights from spoken Urdu meetings to enhance decision-making and content retrieval Guided by Dr .Farah Aeeba, our expertise  in NLP drives a powerful user-friendly, solution.\nJoin us on this journey of discovery!.",
                  textAlign: TextAlign.justify,
                ),
              ),

              verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Cardwidget(
                      pic: laiba,
                      name: "Laiba",
                      description:
                          "Final-year BSCS student specializing in front-end and back-end development with expertise in seamless modal  integration,contributing to the success of our project. ",
                    ),
                    horizontalSpaceSmall,
                    Cardwidget(
                      pic: kashif,
                      name: "Kashif",
                      description:
                          "Final-year BSCS student specializing in modal creation, imparting valuable training and expertise  to elevate user experiences., contributing to the success of our project.",
                    ),
                    horizontalSpaceSmall,
                    Cardwidget(
                      pic: najm,
                      name: "Najm",
                      description:
                          "Final-year BSCS student specializing in modal creation, imparting valuable training and expertise  to elevate user experiences., contributing to the  success of our project.",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  AboutusViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutusViewModel();
}
