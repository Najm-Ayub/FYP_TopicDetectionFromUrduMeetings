import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/app/app.router.dart';

import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';
import '../signin/signin_viewmodel.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  SigninViewModel viewModel1 = SigninViewModel();

  final authservice = locator<AuthenticationService>();

  navigation() {
    _navigationService.navigateToSigninView();
  }

  navigationHome() {
    _navigationService.navigateToHomeView();
  }

  Future<void> isLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userid');

    if (userId != null) {
      Timer(const Duration(seconds: 3), () {
        navigationHome();
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        navigation();
      });
    }
  }
}
