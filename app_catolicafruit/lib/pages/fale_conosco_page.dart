import 'package:app_catolicafruit/pages/catalogo_page.dart';
import 'package:app_catolicafruit/pages/home_page.dart';
import 'package:app_catolicafruit/pages/mensagem_enviada_page.dart';
import 'package:app_catolicafruit/pages/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/shared/comp.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class FaleConoscoPage extends StatefulWidget {
  const FaleConoscoPage({super.key});

  @override
  State<FaleConoscoPage> createState() => _FaleConoscoPageState();
}

class _FaleConoscoPageState extends State<FaleConoscoPage> {
  int _indiceAtual = 2;

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PerfilPage(),
          ),
        );
      }
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FaleConoscoPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          child: GNav(
            rippleColor: Colors.white.withOpacity(0.6),
            hoverColor: Colors.white.withOpacity(0.1),
            haptic: true,
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: Colors.green, width: 2),
            tabBorder: Border.all(color: Colors.green, width: 2),
            tabShadow: [
              BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 8)
            ],
            curve: Curves.easeOutExpo,
            duration: Duration(milliseconds: 900),
            gap: 18,
            color: Colors.green,
            activeColor: Colors.white,
            iconSize: 20,
            tabBackgroundColor: Colors.green.withOpacity(1.0),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Página Inicial',
              ),
              GButton(
                icon: Icons.person,
                text: 'Meu perfil',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PerfilPage()));
                },
              ),
              GButton(
                icon: Icons.headset_mic_outlined,
                text: 'Fale Conosco',
              )
            ],
            selectedIndex: _indiceAtual,
            onTabChange: onTabTapped,
          ),
        ),
      ),
    ));
  }
}
