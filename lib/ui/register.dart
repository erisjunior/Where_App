import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/ui/home.dart';
import 'package:app/common/colors.dart';
import 'package:app/helpers/user.dart';
import 'package:app/domain/user.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserHelper helper = UserHelper();

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() {
    helper.getSingleUser().then((user) {
      if (user.name != '' && user.city != '' && user.state != '') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    });
  }

  String name = '';
  String city = '';
  String state = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(''),
          centerTitle: false,
          foregroundColor: primaryColor,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
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
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          decoration: const InputDecoration(
                              hintText: 'Seu Nome',
                              hintStyle: TextStyle(color: lightGreyColor),
                              labelText: 'Nome',
                              labelStyle: TextStyle(color: greyColor),
                              alignLabelWithHint: true,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              )),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            if (value != null) {
                              name = value;
                            }
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          decoration: const InputDecoration(
                              hintText: 'Sua cidade',
                              hintStyle: TextStyle(color: lightGreyColor),
                              labelText: 'Cidade',
                              labelStyle: TextStyle(color: greyColor),
                              alignLabelWithHint: true,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              )),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            if (value != null) {
                              city = value;
                            }
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          textCapitalization: TextCapitalization.characters,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                          ],
                          decoration: const InputDecoration(
                              hintText: 'Sigla do estado',
                              hintStyle: TextStyle(color: lightGreyColor),
                              labelText: 'Estado',
                              labelStyle: TextStyle(color: greyColor),
                              alignLabelWithHint: true,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              )),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            if (value != null) {
                              state = value;
                            }
                          },
                        )),
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
                      _formKey.currentState!.save();
                      User user = User();
                      user.name = name;
                      user.city = city;
                      user.state = state;
                      helper.saveUser(user).then((value) => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            )
                          });
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
