import 'package:app_catolicafruit/shared/comp.dart';
import 'package:flutter/material.dart';

class MensagemEnviadaPage extends StatefulWidget {
  const MensagemEnviadaPage({super.key});

  @override
  State<MensagemEnviadaPage> createState() => _MensagemEnviadaPageState();
}

class _MensagemEnviadaPageState extends State<MensagemEnviadaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Comp().corPrincipal,
        ),
        title: Text(
          'Fale conosco!',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Comp().corPrincipal,
      ),
        body: Center(
          child: Text(
          'Mensagem enviada com sucesso!',
        style:TextStyle(
          color: Comp().corPrincipal,
        ) ,
        ),
        ),
        ),
      );
  }
}