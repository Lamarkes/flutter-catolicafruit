import 'package:app_catolicafruit/models/usuario_modelo.dart';
import 'package:app_catolicafruit/pages/home_page.dart';
import 'package:app_catolicafruit/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/shared/comp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({super.key});

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  late Usuario usuario;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Comp().corPrincipal,
          ),
          title: Text(
            'Crie a sua conta!',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Comp().corPrincipal,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 29,
              ),
              Image.asset(Comp().logoPrincipal, width: 170, height: 170),
              SizedBox(
                width: largura - 40,
                height: 50,
                child: TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.abc, color: Comp().corPrincipal),
                    label: const Text("Informe o seu nome"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 29,
              ),
              SizedBox(
                width: largura - 40,
                height: 50,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.alternate_email, color: Comp().corPrincipal),
                    label: const Text("Informe o seu e-mail"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 29,
              ),
              SizedBox(
                width: largura - 40,
                height: 50,
                child: TextFormField(
                  controller: telefoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Comp().corPrincipal,
                    ),
                    label: Text("Informe o seu numero de telefone"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 29,
              ),
              SizedBox(
                width: largura - 40,
                height: 50,
                child: TextFormField(
                  controller: senhaController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    label: const Text("Digite a sua senha"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal()),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Icon(Icons.password, color: Comp().corPrincipal),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 29,
              ),
              ElevatedButton(
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: Comp().corPrincipal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 16)),
                onPressed: () async {
                  try {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();

                    pref.setString(Comp().email, emailController.text);
                    pref.setString(Comp().senha, senhaController.text);
                    usuario.nome = nomeController.text;
                    usuario.email = emailController.text;
                    usuario.telefone = telefoneController.text;

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } catch (Exception) {}
                },
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
