import 'package:flutter/material.dart';
import 'package:app/common/colors.dart';
import 'package:app/helpers/call.dart';
import 'package:app/domain/call.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String titleText = "Criar chamado";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CallHelper helper = CallHelper();

  String name = '';
  String description = '';
  String image = '';
  String quantity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(titleText),
          foregroundColor: primaryColor,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.close,
                color: greyColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 21.0, right: 18.0, bottom: 20.0),
          children: <Widget>[
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          decoration: const InputDecoration(
                              hintText: 'Nome do Produto',
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
                              hintText: 'Descrição do Produto',
                              hintStyle: TextStyle(color: lightGreyColor),
                              labelText: 'Descrição',
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
                              description = value;
                            }
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          decoration: const InputDecoration(
                              hintText: 'Quantidade do Produto',
                              hintStyle: TextStyle(color: lightGreyColor),
                              labelText: 'Quantidade',
                              labelStyle: TextStyle(color: greyColor),
                              alignLabelWithHint: true,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              )),
                          keyboardType: TextInputType.number,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            if (value != null) {
                              quantity = value;
                            }
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          decoration: const InputDecoration(
                              hintText: 'Imagem do Produto',
                              hintStyle: TextStyle(color: lightGreyColor),
                              labelText: 'Imagem',
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
                              image = value;
                            }
                          },
                        )),
                  ],
                ),
              ),
            ),
            Container(
              width: 250.0,
              height: 50.0,
              margin: const EdgeInsets.only(top: 37.0),
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
                    Call call = Call();
                    call.name = name;
                    call.description = description;
                    call.image = image;
                    call.quantity = quantity;
                    helper.createCall(call);
                  }
                },
                child: const Text('Concluir'),
              ),
            )
          ],
        ));
  }
}
