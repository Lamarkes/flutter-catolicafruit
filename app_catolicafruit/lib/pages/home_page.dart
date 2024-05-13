import 'package:app_catolicafruit/models/frutas_modelo.dart';
import 'package:app_catolicafruit/models/legumes_modelo.dart';
import 'package:app_catolicafruit/pages/info_sec_page.dart';
import 'package:app_catolicafruit/shared/comp.dart';
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/models/secoes_modelo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;

    List<Secoes> secoes = [
      Secoes(
          nomeSecao: "Seção 1",
          frutas: Fruta(nome: "Maça", qtdeDeFrutas: 20),
          legumes: Legume(nome: "Pepino", qtdeDeLegumes: 10),
          aberto: true)
    ];

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Comp().corPrincipal,
        ),
        title: Text(
          'Seções Disponiveis!',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Comp().corPrincipal,
      ),
      body: Center(
        child: SizedBox(
          width: largura - 30,
          child: ListView.separated(
            separatorBuilder: (_, __) => SizedBox(height: 30),
            itemCount: secoes.length,
            itemBuilder: (_, index) => Container(
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              InfoSecPage(secoes: secoes[index])));
                },
                leading: Icon(
                  Icons.apple_sharp,
                  color: Comp().corPrincipal,
                ),
                title: Text(
                  secoes[index].nomeSecao!,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
    );
  }
}
