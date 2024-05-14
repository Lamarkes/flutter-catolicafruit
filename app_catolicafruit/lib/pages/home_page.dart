import 'package:app_catolicafruit/models/frutas_modelo.dart';
import 'package:app_catolicafruit/models/legumes_modelo.dart';
import 'package:app_catolicafruit/pages/perfil_page.dart';
import 'package:app_catolicafruit/shared/comp.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../shared/comp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;

    return Scaffold(
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
          'Seções',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Comp().corPrincipal,
      ),
      body: Center(
        child: SizedBox(
          width: largura - 30,
          child: ListView.separated(
            separatorBuilder: (_, __) => SizedBox(height: 3),
            itemCount: 2,
            itemBuilder: (_, index) => Container(
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                onTap: () {
                  // Implement your logic here
                },
                leading: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Comp().corPrincipal,
                ),
                title: Text(
                  index == 0 ? 'Frutas Disponíveis' : 'Legumes Disponíveis',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: GNav(
            rippleColor: Colors.white.withOpacity(0.6),
            hoverColor: const Color.fromARGB(255, 197, 76, 76),
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
            color: Colors.green, // Alterado para branco
            activeColor: Colors.white, // Alterado para verde
            iconSize: 24,
            tabBackgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabs: [
              GButton(
                icon: Icons.shopping_basket,
                text: 'Seções',
                
              ),
              GButton(
                icon: Icons.person,
                text: 'Meu perfil',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilPage()));
                },
              ),
            ],
            selectedIndex: _indiceAtual,
            onTabChange: onTabTapped,
          ),
        ),
      ),
    );
  }
}
