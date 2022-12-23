import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Services
import 'package:flutter_06_auth/auth/services/_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), actions: [
        IconButton(
            onPressed: () async {
              final navigate = Navigator.of(context);
              await GoogleSingInService.signOut();
              navigate.pushReplacementNamed("signin");
            },
            icon: const Icon(FontAwesomeIcons.doorOpen))
      ]),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
