import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import '../../../common/app_strings.dart';
import 'slider_model.dart';

class Sliderwidget extends StackedView<SliderModel> {
  const Sliderwidget({super.key});

  @override
  Widget builder(
    BuildContext context,
    SliderModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // verticalSpaceMassive,
          Stack(children: [
            SizedBox(
              height: screenHeight(context),
              child: CarouselSlider(
                items: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 30, bottom: 30, right: 20),
                    child: Container(
                      width: double.infinity, // Fill the entire width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(image1),
                          fit: BoxFit
                              .cover, // Ensure the image covers the entire container
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 30, bottom: 30, right: 20),
                    child: Container(
                      width: double.infinity, // Fill the entire width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(image2),
                          fit: BoxFit
                              .cover, // Ensure the image covers the entire container
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 30, bottom: 30, right: 20),
                    child: Container(
                      width: double.infinity, // Fill the entire width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(image3),
                          fit: BoxFit
                              .cover, // Ensure the image covers the entire container
                        ),
                      ),
                    ),
                  ),
    
                  // Image(image: AssetImage(image2),height: screenHeight(context),),
                  // Image(image: AssetImage(image3)),
                ],
                options: CarouselOptions(
                  aspectRatio: 1,
                  viewportFraction: 1.0, //16 / 9,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  // Dots indicator upper show hoga
                  onPageChanged: (index, reason) {
                    viewModel.updateindex(index);
                  },
                ),
              ),
            ),
            verticalSpaceLarge,
            Positioned(
              top: 540,
              left: 100,
              //bottom: 50,
    
              child: Container(
                width: 80,
                height: 25,
                decoration: BoxDecoration(
                  color: kcDarkGreyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: viewModel.currentCarouselIndex == i
                              ? kcpurpleColor // Set the active dot color
                              : kcVeryLightGrey,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  @override
  SliderModel viewModelBuilder(
    BuildContext context,
  ) =>
      SliderModel();
}
