import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/app/app.router.dart';
import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';
import '../../common/app_strings.dart';

class LandingPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String name = "home";

  void replaceWithSignin() {
    _navigationService.replaceWithSigninView();
  }

  void navigateSignup() {
    _navigationService.replaceWithSignupView();
  }

  pagenavigate(String namepage) {
    name = namepage;
    notifyListeners();
  }

  tickMark() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kcPrimaryColor,
      ),
      child: Image(image: AssetImage(Tick)),
    );
  }

  Widget _buildNavigationButton(
      String title, String pageName, LandingPageViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          viewModel.pagenavigate(pageName);
        },
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: viewModel.name == pageName
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: kcVeryLightGrey
                
                // viewModel.name == pageName
                //     ? kcpurpleColor
                //     : kcVeryLightGrey,
              ),
            ),
            // Display a line below the selected button
            Container(
              height: 2,
              width: 30, // Adjust the width as needed
              color:kcVeryLightGrey
              //  viewModel.name == pageName
              //     ? kcpurpleColor
              //     : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
