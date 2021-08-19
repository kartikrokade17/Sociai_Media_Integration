// SMI : Social Media Integration main dart file
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_login/login_controller.dart';
import 'login_page.dart';
void main(){
  runApp(SMIApp());
}

class SMIApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: LoginPage(),
        ),
     ],
     child: MaterialApp(
      home: LoginPage(),
    ),
    );
  }
}