import 'package:app_catolicafruit/models/usuario_modelo.dart';
import 'package:app_catolicafruit/pages/fale_conosco_page.dart';
import 'package:app_catolicafruit/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/shared/comp.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  Usuario usuario =
      Usuario(nome: "Lamark", email: "lala@gmail.com", telefone: "44444444");

  int _indiceAtual = 1;

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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Comp().corPrincipal,
        ),
        backgroundColor: Comp().corPrincipal,
        title: Text(
          "Meu Perfil",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/img_perfil.png', width: 270, height: 150),
            Padding(
              padding: EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(
                  Icons.person_outline,
                  color: Comp().corPrincipal,
                  size: 30,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Color.fromRGBO(246, 246, 246, 1),
                title: Text('${usuario.nome}'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Comp().corPrincipal,
                  size: 30,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Color.fromRGBO(246, 246, 246, 1),
                title: Text('${usuario.telefone}'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Comp().corPrincipal,
                  size: 30,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Color.fromRGBO(246, 246, 246, 1),
                title: Text('${usuario.email}'),
              ),
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
    );
  }
}
