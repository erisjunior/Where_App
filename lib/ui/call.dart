import 'package:flutter/material.dart';
import 'package:app/common/colors.dart';
import 'package:app/domain/call.dart';

class CallPage extends StatefulWidget {
  Call? call;

  CallPage({this.call});

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  List<dynamic> answers = [];

  @override
  void initState() {
    super.initState();
    updateAnswers();
  }

  void updateAnswers() {
    answers = widget.call?.answers ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.call?.name ?? ""),
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
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greyColor,
                            image: DecorationImage(
                                image: NetworkImage(widget.call!.image))),
                      ),
                    ),
                  ),
                  Text(widget.call!.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16.0)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text('Categoria: ' + (widget.call?.category ?? ""),
                        style:
                            const TextStyle(fontSize: 16.0, color: greyColor)),
                  ),
                  Text('Quantidade: ' + (widget.call?.quantity ?? "") + 'x',
                      style: const TextStyle(fontSize: 16.0, color: greyColor)),
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
                        itemCount: answers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset('images/loja.png',
                                fit: BoxFit.cover),
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Text(answers[index]['store_name']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(answers[index]['store_address'],
                                    style: const TextStyle(
                                        fontSize: 12.0, color: greyColor)),
                                Text(answers[index]['store_phone'],
                                    style: const TextStyle(
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
