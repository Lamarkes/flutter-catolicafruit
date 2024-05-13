
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/pages/login_page.dart';
import 'package:app_catolicafruit/shared/comp.dart';

class SpalshScreenPage extends StatefulWidget {
  const SpalshScreenPage({super.key});

  @override
  State<SpalshScreenPage> createState() => _SpalshScreenPageState();
}

class _SpalshScreenPageState extends State<SpalshScreenPage> {

   @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
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
    return SafeArea(
      child: Scaffold( 
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                Comp().logoPrincipal,
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                'Seja bem-vindo,\n ao nosso hortFruit! =)\n ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Comp().corPrincipal,
                  fontSize: 15,
                      ),
                    ),
                  ],
                  ),
              )
            ],
            ) 
        ),
      )
      );
  }
}