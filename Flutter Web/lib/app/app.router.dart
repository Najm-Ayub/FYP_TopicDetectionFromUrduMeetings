// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i14;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;
import 'package:topicdetectionweb/ui/views/aboutus/aboutus_view.dart' as _i7;
import 'package:topicdetectionweb/ui/views/contactus/contactus_view.dart'
    as _i8;
import 'package:topicdetectionweb/ui/views/dashborad/dashborad_view.dart'
    as _i10;
import 'package:topicdetectionweb/ui/views/f_a_qs/f_a_qs_view.dart' as _i13;
import 'package:topicdetectionweb/ui/views/historypage/Project_view.dart'
    as _i6;
import 'package:topicdetectionweb/ui/views/home/home_view.dart' as _i5;
import 'package:topicdetectionweb/ui/views/home/home_viewmodel.dart' as _i15;
import 'package:topicdetectionweb/ui/views/landing_page/landing_page_view.dart'
    as _i9;
import 'package:topicdetectionweb/ui/views/privacy_policy/privacy_policy_view.dart'
    as _i12;
import 'package:topicdetectionweb/ui/views/setting/setting_view.dart' as _i11;
import 'package:topicdetectionweb/ui/views/signin/signin_view.dart' as _i4;
import 'package:topicdetectionweb/ui/views/signup/signup_view.dart' as _i3;
import 'package:topicdetectionweb/ui/views/startup/startup_view.dart' as _i2;

class Routes {
  static const startupView = '/startup-view';

  static const signupView = '/signup-view';

  static const signinView = '/signin-view';

  static const homeView = '/home-view';

  static const historypageView = '/historypage-view';

  static const aboutusView = '/aboutus-view';

  static const contactusView = '/contactus-view';

  static const landingPageView = '/landing-page-view';

  static const dashboradView = '/dashborad-view';

  static const settingView = '/setting-view';

  static const privacyPolicyView = '/privacy-policy-view';

  static const fAQsView = '/f-aqs-view';

  static const all = <String>{
    startupView,
    signupView,
    signinView,
    homeView,
    historypageView,
    aboutusView,
    contactusView,
    landingPageView,
    dashboradView,
    settingView,
    privacyPolicyView,
    fAQsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i3.SignupView,
    ),
    _i1.RouteDef(
      Routes.signinView,
      page: _i4.SigninView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i5.HomeView,
    ),
    _i1.RouteDef(
      Routes.historypageView,
      page: _i6.HistorypageView,
    ),
    _i1.RouteDef(
      Routes.aboutusView,
      page: _i7.AboutusView,
    ),
    _i1.RouteDef(
      Routes.contactusView,
      page: _i8.ContactusView,
    ),
    _i1.RouteDef(
      Routes.landingPageView,
      page: _i9.LandingPageView,
    ),
    _i1.RouteDef(
      Routes.dashboradView,
      page: _i10.DashboradView,
    ),
    _i1.RouteDef(
      Routes.settingView,
      page: _i11.SettingView,
    ),
    _i1.RouteDef(
      Routes.privacyPolicyView,
      page: _i12.PrivacyPolicyView,
    ),
    _i1.RouteDef(
      Routes.fAQsView,
      page: _i13.FAQsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.SignupView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SignupView(),
        settings: data,
      );
    },
    _i4.SigninView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SigninView(),
        settings: data,
      );
    },
    _i5.HomeView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.HomeView(),
        settings: data,
      );
    },
    _i6.HistorypageView: (data) {
      final args = data.getArgs<HistorypageViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.HistorypageView(
            key: args.key, homeViewModel: args.homeViewModel),
        settings: data,
      );
    },
    _i7.AboutusView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.AboutusView(),
        settings: data,
      );
    },
    _i8.ContactusView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ContactusView(),
        settings: data,
      );
    },
    _i9.LandingPageView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.LandingPageView(),
        settings: data,
      );
    },
    _i10.DashboradView: (data) {
      final args = data.getArgs<DashboradViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.DashboradView(
            key: args.key, homeViewModel: args.homeViewModel),
        settings: data,
      );
    },
    _i11.SettingView: (data) {
      final args = data.getArgs<SettingViewArguments>(
        orElse: () => const SettingViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.SettingView(key: args.key, data: args.data),
        settings: data,
      );
    },
    _i12.PrivacyPolicyView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.PrivacyPolicyView(),
        settings: data,
      );
    },
    _i13.FAQsView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.FAQsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HistorypageViewArguments {
  const HistorypageViewArguments({
    this.key,
    required this.homeViewModel,
  });

  final _i14.Key? key;

  final _i15.HomeViewModel homeViewModel;

  @override
  String toString() {
    return '{"key": "$key", "homeViewModel": "$homeViewModel"}';
  }

  @override
  bool operator ==(covariant HistorypageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.homeViewModel == homeViewModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^ homeViewModel.hashCode;
  }
}

class DashboradViewArguments {
  const DashboradViewArguments({
    this.key,
    required this.homeViewModel,
  });

  final _i14.Key? key;

  final _i15.HomeViewModel homeViewModel;

  @override
  String toString() {
    return '{"key": "$key", "homeViewModel": "$homeViewModel"}';
  }

  @override
  bool operator ==(covariant DashboradViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.homeViewModel == homeViewModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^ homeViewModel.hashCode;
  }
}

class SettingViewArguments {
  const SettingViewArguments({
    this.key,
    this.data,
  });

  final _i14.Key? key;

  final dynamic data;

  @override
  String toString() {
    return '{"key": "$key", "data": "$data"}';
  }

  @override
  bool operator ==(covariant SettingViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ data.hashCode;
  }
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSigninView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistorypageView({
    _i14.Key? key,
    required _i15.HomeViewModel homeViewModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.historypageView,
        arguments:
            HistorypageViewArguments(key: key, homeViewModel: homeViewModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutusView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutusView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactusView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactusView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLandingPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.landingPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboradView({
    _i14.Key? key,
    required _i15.HomeViewModel homeViewModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dashboradView,
        arguments:
            DashboradViewArguments(key: key, homeViewModel: homeViewModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingView({
    _i14.Key? key,
    dynamic data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.settingView,
        arguments: SettingViewArguments(key: key, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPrivacyPolicyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.privacyPolicyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFAQsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.fAQsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSigninView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistorypageView({
    _i14.Key? key,
    required _i15.HomeViewModel homeViewModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.historypageView,
        arguments:
            HistorypageViewArguments(key: key, homeViewModel: homeViewModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAboutusView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutusView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactusView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactusView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLandingPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.landingPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboradView({
    _i14.Key? key,
    required _i15.HomeViewModel homeViewModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.dashboradView,
        arguments:
            DashboradViewArguments(key: key, homeViewModel: homeViewModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingView({
    _i14.Key? key,
    dynamic data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.settingView,
        arguments: SettingViewArguments(key: key, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPrivacyPolicyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.privacyPolicyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFAQsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.fAQsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
