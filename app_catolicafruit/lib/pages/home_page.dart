import 'package:app_catolicafruit/models/frutas_modelo.dart';
import 'package:app_catolicafruit/models/legumes_modelo.dart';
import 'package:app_catolicafruit/pages/catalogo_page.dart';
import 'package:app_catolicafruit/pages/fale_conosco_page.dart';
import 'package:app_catolicafruit/pages/listagem_produtos_page.dart';
import 'package:app_catolicafruit/pages/login_page.dart';
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
      if (index == 1) {
        // Índice 1 corresponde ao ícone do carrinho
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatalogoPage(
                frutas: frutasDisponiveis, legumes: legumesDisponiveis),
          ),
        );
      }
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PerfilPage(),
          ),
        );
      }
      if (index == 3) {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => FaleConoscoPage()),
        );
      }
    });
  }

  List<Fruta> todasFrutas = [
    Fruta(nome: 'Maçã', qtdeDeFrutas: 10, preco: 2.5, disponivel: true),
    Fruta(nome: 'Banana', qtdeDeFrutas: 15, preco: 1.8, disponivel: true),
    Fruta(nome: 'Morango', qtdeDeFrutas: 8, preco: 4.0, disponivel: false),
  ];

  List<Legume> todosLegumes = [
    Legume(nome: 'Tomate', qtdeDeLegumes: 20, preco: 3.2, disponivel: true),
    Legume(nome: 'Alface', qtdeDeLegumes: 12, preco: 2.0, disponivel: false),
    Legume(nome: 'Cenoura', qtdeDeLegumes: 16, preco: 2.5, disponivel: true),
  ];

  List<Fruta> frutasDisponiveis = [];
  List<Legume> legumesDisponiveis = [];

  @override
  void initState() {
    super.initState();
    frutasDisponiveis =
        todasFrutas.where((fruta) => fruta.disponivel == true).toList();
    legumesDisponiveis =
        todosLegumes.where((legume) => legume.disponivel == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginPage()));
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
          'FreshFruit',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Comp().corPrincipal,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Espaçamento entre AppBar e o conteúdo
            Container(
              color: Comp().corPrincipal.withOpacity(0.02),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Image.asset(Comp().logoPrincipal, width: 300, height: 270),
                  Text(
                    'Seja bem-vindo!',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Explore nossos produtos e encontre o que você precisa.',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CatalogoPage(
                        frutas: frutasDisponiveis, legumes: legumesDisponiveis),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: Text('Catálogo'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListagemProdutosPage(
                        frutas: todasFrutas, legumes: todosLegumes),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text('Lista de Nossos Produtos'),
            ),
            SizedBox(height: 20),
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
              GButton(icon: Icons.shopping_bag_outlined, text: 'Catálogo'),
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
