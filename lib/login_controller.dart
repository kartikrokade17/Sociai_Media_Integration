//Controls login credentials
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginController with ChangeNotifier{
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  Map? userData;

  String? url;
  String? name;
  String? email;

  googleLogin() async{
    this.googleAccount = await _googleSignIn.signIn();
    this.url = googleAccount!.photoUrl;
    this.name = googleAccount!.displayName;
    this.email = googleAccount!.email;
    notifyListeners();
  }

  facebookLogin() async{
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile","email"],
    );

    if(result.status == LoginStatus.success){
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );
      userData = requestData;
      this.url = userData!["picture"]["data"]["url"];
      this.name = userData!["name"];
      this.email = userData!["email"];
      notifyListeners();
    }
  }

  logOut() async{
    this.googleAccount = await _googleSignIn.signOut();
    await FacebookAuth.i.logOut();

    this.url = null;
    this.name = null;
    this.email = null;
    notifyListeners();
  }
}