import 'package:app_catolicafruit/shared/comp.dart';
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/models/frutas_modelo.dart';
import 'package:app_catolicafruit/models/legumes_modelo.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:app_catolicafruit/pages/home_page.dart';

class ListagemProdutosPage extends StatefulWidget {
  final List<Fruta> frutas;
  final List<Legume> legumes;

  const ListagemProdutosPage(
      {Key? key, required this.frutas, required this.legumes})
      : super(key: key);

  @override
  _ListagemProdutosPageState createState() => _ListagemProdutosPageState();
}

class _ListagemProdutosPageState extends State<ListagemProdutosPage> {
  int _indiceAtual = -1;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todos os Produtos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Comp().corPrincipal,
        iconTheme: IconThemeData(
          color: Colors.white, 
        ),
      ),
      body: ListView.builder(
        itemCount: widget.frutas.length + widget.legumes.length,
        itemBuilder: (context, index) {
          if (index < widget.frutas.length) {
            Fruta fruta = widget.frutas[index];
            return _buildProdutoTile(
              context,
              nome: fruta.nome ?? 'Nome não disponível',
              preco: fruta.preco != null
                  ? 'Preço: R\$ ${fruta.preco!.toStringAsFixed(2)}'
                  : 'Preço não disponível',
            );
          } else {
            int legumeIndex = index - widget.frutas.length;
            Legume legume = widget.legumes[legumeIndex];
            return _buildProdutoTile(
              context,
              nome: legume.nome ?? 'Nome não disponível',
              preco: legume.preco != null
                  ? 'Preço: R\$ ${legume.preco!.toStringAsFixed(2)}'
                  : 'Preço não disponível',
            );
          }
        },
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

  Widget _buildProdutoTile(BuildContext context,
      {required String nome, required String preco}) {
    return ListTile(
      leading: Icon(Icons.food_bank),
      title: Text(nome),
      subtitle: Text(preco),
    );
  }
}
