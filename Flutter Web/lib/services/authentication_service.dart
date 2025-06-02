import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String? userId;

  Future logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('userId');
      print("logout sucessfull");
    } catch (e) {
      print("Logout error: $e");
    }
  }

  Future<User?> login(String email, String password) async {
    final UserCredential authResult =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    userId = authResult.user!.uid;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userid', userId!);

    userId = prefs.getString('userid');

    return authResult.user;
  }
}
