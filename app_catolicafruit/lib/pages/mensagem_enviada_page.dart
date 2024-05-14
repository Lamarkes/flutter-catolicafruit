import 'package:app_catolicafruit/shared/comp.dart';
import 'package:flutter/material.dart';

class MensagemEnviadaPage extends StatefulWidget {
  const MensagemEnviadaPage({Key? key}) : super(key: key);

  @override
  State<MensagemEnviadaPage> createState() => _MensagemEnviadaPageState();
}

class _MensagemEnviadaPageState extends State<MensagemEnviadaPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Mensagem enviada com sucesso!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Voltar para a tela anterior
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

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
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/fruitninja.gif',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
