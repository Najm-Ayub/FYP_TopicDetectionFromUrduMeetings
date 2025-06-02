import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'setting_view.dart';
import 'setting_viewmodel.dart';

class SettingBodyView extends StackedView<SettingViewModel> {
  const SettingBodyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingViewModel viewModel,
    Widget? child,
  ) {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("UserProfile")
            .doc(currentUser.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(left: 600),
              child: SpinKitFadingCircle(
                // Use the SpinKitWave spinner
                color: kcPrimaryColor,
                size: 30.0,
              ),
            );
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const SettingView(data: {});
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return SettingView(
            data: data,
          );
        },
      );
    } else {
      return const Text("User is not logged in.");
    }
  }

  @override
  SettingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingViewModel();
}
