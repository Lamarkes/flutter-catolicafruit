
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/pages/login_page.dart';

class SpalshScreenPage extends StatefulWidget {
  const SpalshScreenPage({super.key});

  @override
  State<SpalshScreenPage> createState() => _SpalshScreenPageState();
}

class _SpalshScreenPageState extends State<SpalshScreenPage> {

   @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold( 
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Seja bem vindo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 15,
              ),
              ),
            ],
            ) 
        ),
      )
      );
  }
}