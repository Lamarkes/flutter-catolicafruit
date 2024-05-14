import 'package:app_catolicafruit/models/usuario_modelo.dart';
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/shared/comp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPage extends StatelessWidget {
  PerfilPage({super.key});

  Usuario usuario =
      Usuario(nome: "Lamark", email: "lala@gmail.com", telefone: "44444444");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
    );
  }
}
