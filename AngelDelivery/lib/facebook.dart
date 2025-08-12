import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLoginScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> _signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();
    final accessToken = result.accessToken;
    final facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken!.token);

    return await _auth.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/face.jpg"),
      ),
      onPressed: () {
        _signInWithFacebook();
      },
    );
  }
}
