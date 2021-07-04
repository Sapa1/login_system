import 'package:flutter/material.dart';
import 'package:login/create_password.dart';
import 'package:login/input_text_widget.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({this.newPassword = ''});
  String? newPassword;

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final controller = CreatePassController();

  @override
  Widget build(BuildContext context) {
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
            Center(
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
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.4,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                child: Column(
                  children: [
                    InputText(
                      obscureText: true,
                      label: 'Create Password',
                      validator: (value) =>
                          value!.isEmpty ? 'Senha não criada' : null,
                      onChanged: (value) {
                        controller.newOnChanged(firstPass: value);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 42.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.newPassword = controller.firstPass;
                          });
                          if (controller.passCreated()) {
                            widget.newPassword = controller.getPassword();
                            Navigator.pushReplacementNamed(context, '/login',
                                arguments: widget.newPassword);
                          }
                        },
                        child: Text('Salvar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
