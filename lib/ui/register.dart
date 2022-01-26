import 'package:flutter/material.dart';
import 'package:app/ui/home.dart';
import 'package:app/common/colors.dart';
import 'package:app/components/input.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(''),
          centerTitle: false,
          foregroundColor: primaryColor,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(children: <Widget>[
              const Text('Seja bem-vindo',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: primaryColor,
                      fontFamily: 'DMSans',
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal)),
              const Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                      'O Where foi criado para você poder consultar todas as lojas cadastradas na sua cidade em busca do produto que estiver precisando.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: greyColor,
                          fontFamily: 'DMSans',
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal))),
              const Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text('Vamos começar com algumas informações.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: greyColor,
                          fontFamily: 'DMSans',
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal))),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildInput('Nome', 'Seu nome'),
                    buildInput('Cidade', 'Sua cidade'),
                    buildInput('Estado', 'Seu estado'),
                  ],
                ),
              ),
              Container(
                width: 250.0,
                height: 50.0,
                margin: const EdgeInsets.only(top: 20.0),
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    }
                  },
                  child: const Text('Concluir'),
                ),
              )
            ]),
            padding: const EdgeInsets.all(17.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ));
  }
}
