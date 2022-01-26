import 'package:flutter/material.dart';
import 'call.dart';
import 'create.dart';
import 'package:app/common/colors.dart';
import 'package:app/helpers/call.dart';
import 'package:app/domain/call.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String titleText = "Where";
  CallHelper helper = CallHelper();
  List<dynamic> calls = [];

  @override
  void initState() {
    super.initState();
    updateCalls();
  }

  void updateCalls() {
    helper.getAllCalls().then((callsMap) {
      setState(() {
        calls = callsMap;
      });
    });
  }

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
            Icons.home,
            color: primaryColor,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Create()),
            );
          },
          backgroundColor: primaryColor,
          child: const Icon(Icons.add),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 20.0, bottom: 3.0),
                    child: Text('Chamados abertos',
                        style: TextStyle(fontSize: 24.0, color: primaryColor)),
                  ),
                  SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: calls.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: lightGreyColor,
                              child: Icon(
                                Icons.crop_square,
                                color: primaryColor,
                              ),
                            ),
                            title: Text(calls[index]['name']),
                            subtitle: const Text('Categoria do produto'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CallPage()),
                              );
                            },
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator(color: primaryColor));
  }

  Widget buildError() {
    String text = "Erro ao carregar dados!";
    double fontSize = 25.0;
    return Center(
        child: Text(
      text,
      style: TextStyle(color: primaryColor, fontSize: fontSize),
      textAlign: TextAlign.center,
    ));
  }
}
