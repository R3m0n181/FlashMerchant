import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../SE/SE_Menu.dart';
import 'LogIn.dart';

class LogInAuth extends StatefulWidget {
  const LogInAuth({Key? key}) : super(key: key);

  @override
  State<LogInAuth> createState() => _LogInAuthState();
}

class _LogInAuthState extends State<LogInAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return SE_Menu();
          }
          else {
            return LogIn();
          }
        },
      ),
    );
  }
}
