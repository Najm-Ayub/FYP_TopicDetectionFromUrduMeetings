import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

import '../signin_viewmodel.dart';

// Initialize Firebase
FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        '770365428478-m2f0b0nncj2ie71oa9bllruv8j0t8b37.apps.googleusercontent.com');

Widget googleButton(BuildContext context, String iconPath, String title,
    double height, VoidCallback onTap) {
  SigninViewModel viewModel1 = SigninViewModel();
  double textFieldWidth = MediaQuery.of(context).size.width >= 768
      ? quarterScreenWidth(context)
      : halfScreenWidth(context) * 1.6;
  String? userId;
  Future<void> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        //Sign in with Firebase
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User user = authResult.user!;
        // //  final SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString('userid', userId!);
        viewModel1.toastService.toastmessage("Login Succsessfully");
        viewModel1.navigationHome();

        //Store user information in Firebase Firestore

        // final CollectionReference users =
        //     FirebaseFirestore.instance.collection('users');
        // await users.doc(user.uid).set({
        //   'displayName': user.displayName,
        //   'email': user.email,
        //   // Add other user information as needed
        // });

        print("Successful login");
      }
    } catch (error) {
      print(error);
    }
  }

  return InkWell(
    onTap: handleGoogleSignIn,
    child: Container(
      height: height,
      width: textFieldWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: kcMediumGrey),
      ),
      child: Row(
        children: [
          horizontalSpaceLarge,
          SvgPicture.asset(
            iconPath,
            width: 20.0,
            height: 20.0,
          ),
          horizontalSpaceLarge,
          Text(
            title,
            style: const TextStyle(color: kcDarkGreyColor),
          ),
        ],
      ),
    ),
  );
}
