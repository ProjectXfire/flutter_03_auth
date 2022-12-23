import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Services
import 'package:flutter_06_auth/auth/services/_services.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  minWidth: double.infinity,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.blue,
                  splashColor: Colors.transparent,
                  onPressed: () async {
                    final navigate = Navigator.of(context);
                    final account =
                        await GoogleSingInService.signInWithGoogle();
                    if (account != null) navigate.pushReplacementNamed("home");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(FontAwesomeIcons.google, color: Colors.white),
                      SizedBox(width: 10),
                      Text("Sign in", style: TextStyle(color: Colors.white))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
