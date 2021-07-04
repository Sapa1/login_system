import 'package:flutter/material.dart';
import 'package:login/input_text_widget.dart';
import 'package:login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(this.test, {Key? key}) : super(key: key);
  final String test;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final test2 = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blueAccent, Colors.blue.shade400],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 3),
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    child: Column(
                      children: [
                        InputText(
                          textInputType: TextInputType.emailAddress,
                          label: 'E-mail',
                          validator: (value) => value!.isEmpty ? 'Vazio' : null,
                          onChanged: (value) {
                            controller.onChanged(email: value);
                          },
                        ),
                        InputText(
                          obscureText: true,
                          label: 'Password',
                          validator: (value) => value!.isEmpty ? 'Vazio' : null,
                          onChanged: (value) {
                            controller.onChanged(password: value);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 4,
                            ),
                            child: Text('Entrar'),
                            onPressed: () {
                              if (controller.login(test2)) {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
