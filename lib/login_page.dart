// Login Page for App
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:social_media_login/login_controller.dart';
import 'loginWidgets.dart';

class LoginPage extends StatefulWidget {

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginUI(),
    );
  }

  loginUI(){
    return Consumer<LoginController>(
        builder: (context, model, child){
          if(model.email != null) {
                return Center(child: loggedInUI(model),);
          }
          else{
            return loginControls(context);
          }
          },
        );
   }

  loggedInUI(LoginController model) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0CC4C4),
        title: Center(child: Text('User Information')),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF4AE2E2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: Image.network(model.url ?? '').image,
                radius: 40,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                model.name ?? '',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 150.0,
                child: Divider(
                  thickness: 5.0,
                ),
              ),
              Text(model.email ?? '',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: 200.0,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () {
                    Provider.of<LoginController>(context, listen: false).logOut();
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  loginControls(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF78DCDC),
                    Color(0xFF6EE8E5),
                    Color(0xFF5AE4E8),
                    Color(0xFF4AE2E2),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    emailTextField(),
                    SizedBox(
                      height: 30.0,
                    ),
                    passwordTextField(),
                    forgotPasswordBtn(),
                    loginBtn(),
                    signInWithText(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          socialMediaBtn (
                                () {
                                  Provider.of<LoginController>(context, listen: false).facebookLogin();
                            },
                            AssetImage(
                              'assets/logos/facebook.jpg',
                            ),
                          ),
                          socialMediaBtn(
                                () {
                              Provider.of<LoginController>(context, listen: false).googleLogin();
                            },
                            AssetImage(
                              'assets/logos/google.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    signUpBtn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

}


