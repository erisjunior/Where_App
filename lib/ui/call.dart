import 'package:flutter/material.dart';
import 'package:app/common/colors.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  String titleText = "Produto";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(titleText),
          centerTitle: false,
          foregroundColor: primaryColor,
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: const Icon(
            Icons.crop_square,
            color: primaryColor,
          ),
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
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                    left: 21.0, right: 18.0, bottom: 20.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 27.0, bottom: 27.0),
                    child: Center(
                      child: Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/produto.png'))),
                      ),
                    ),
                  ),
                  const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16.0)),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text('Categorias: Esportes',
                        style: TextStyle(fontSize: 16.0, color: greyColor)),
                  ),
                  const Text('Quantidade: 1x',
                      style: TextStyle(fontSize: 16.0, color: greyColor)),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                    child: Text('Lojas que possuem',
                        style: TextStyle(fontSize: 20.0, color: primaryColor)),
                  ),
                  SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset('images/loja.png',
                                fit: BoxFit.cover),
                            contentPadding: const EdgeInsets.all(0.0),
                            title: const Text('Amazonias Stores'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                    'Av. Senador Salgadinho Filho, Lagoa Nova, 59999-15',
                                    style: TextStyle(
                                        fontSize: 12.0, color: greyColor)),
                                Text('(84) 9999-9999',
                                    style: TextStyle(
                                        fontSize: 12.0, color: greyColor)),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
