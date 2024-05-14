import 'package:app_catolicafruit/pages/criar_conta_page.dart';
import 'package:app_catolicafruit/pages/fale_conosco_page.dart';
import 'package:app_catolicafruit/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_catolicafruit/shared/comp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Comp().logoPrincipal, width: 300, height: 270),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 310,
                height: 50,
                child: TextFormField(
                  controller: emailController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                        child: Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: Comp().corPrincipal,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 16)),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? storedEmail = prefs.getString(Comp().email);
                          String? storedPassword =
                              prefs.getString(Comp().senha);

                          print('Email armazenado: $storedEmail');
                          print('Senha armazenada: $storedPassword');
                          print('Email digitado: ${emailController.text}');
                          print('Senha digitada: ${senhaController.text}');

                          if (emailController.text == storedEmail &&
                              senhaController.text == storedPassword) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration:
                                      Duration(seconds: 2, milliseconds: 500),
                                  content:
                                      Text('Usuário ou senha inválidos.')),
                            );
                          }
                        })),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FaleConoscoPage()),
                );
              },
              child: Text(
                "Crie a sua Conta",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: Comp().corPrincipal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 16)),
            ),
          ],
        ),
      ),
    ));
  }
}
