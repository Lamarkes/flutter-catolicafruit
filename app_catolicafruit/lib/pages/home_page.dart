import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body:Center(
          child: SizedBox(
            width: largura - 30,
          ),
          ) ,
      ),
    );
  }
}