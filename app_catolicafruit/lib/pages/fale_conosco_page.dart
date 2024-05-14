import 'package:app_catolicafruit/pages/mensagem_enviada_page.dart';
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/shared/comp.dart';

class FaleConoscoPage extends StatefulWidget {
  const FaleConoscoPage({super.key});

  @override
  State<FaleConoscoPage> createState() => _FaleConoscoPageState();
}

class _FaleConoscoPageState extends State<FaleConoscoPage> {
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
          'Fale Conosco!',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Comp().corPrincipal,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 310,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Digite o seu e-mail"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal()),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Icon(Icons.alternate_email_rounded,
                          color: Comp().corPrincipal),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 310,
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  label: const Text("Digite a sua mensagem que deseja enviar"),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal()),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Icon(Icons.abc, color: Comp().corPrincipal),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      child: Text(
                        'Enviar',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: Comp().corPrincipal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 16)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MensagemEnviadaPage()));
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
