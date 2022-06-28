import 'dart:convert';

import 'package:br/view/screens/minha_conta/pedidosPage.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class PromocoesRoute extends StatefulWidget {
  final LocalStorage storage;
  const PromocoesRoute({Key? key, required this.storage}) : super(key: key);

  State<PromocoesRoute> createState() => _PromocoesRouteState();
}

class _PromocoesRouteState extends State<PromocoesRoute> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {

    var storage = widget.storage;


    showAlertDialog(BuildContext context) {

      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PedidosRoute(storage: storage)),
          );
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Combo"),
        content: Text("Seu combo foi adicionado ao carrinho."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    // set up the button

    return Scaffold(
      appBar: AppBar(
        title: const Text('Promoções'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: SizedBox(
        height: 60, // <-- Your height
        child: ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      pageController.previousPage(duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                    },
                    child: Icon(Icons.arrow_back_ios),
                    color: Colors.red,
                    textColor: Colors.white,
                  )),
              Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                    },
                    child: Icon(Icons.arrow_forward_ios),
                    color: Colors.red,
                    textColor: Colors.white,
                  )),
            ],
          ),
        ),
      ),
      body: Center(
        child: PageView(
          controller: pageController,
          children: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(blurRadius: 34)
                      ],
                      color: Colors.red,
                      //image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/l.jpg'))
                    ),
                    height: 230,
                    width: 230,
                    child: Container(decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/c1.jpg')))),
                  ),
                  ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 580, maxWidth: 300),
                      //child: FittedBox(
                      //child: Text("Olá, sou o Flávio, tenho 20 anos, natural de Maués, Amazonas, e essa é uma ótima biografia.'"),
                      //),
                      child: Container(
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  "COMBO 1",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 PIZZA MUSSARELA",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 PIZZA DE CHOCOLATE",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 COCA 2 LITROS",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- R\$ 90 ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 300, // <-- Your height
                                      child: RaisedButton(
                                        child: Text(
                                          "Enviar para o carrinho",
                                          style: TextStyle(fontSize: 27),
                                        ),
                                        onPressed: () {

                                          var carrinho = widget.storage.getItem('carrinho');

                                          List carrinhoObj = [];

                                          if (carrinho != null && carrinho.length > 0) {
                                            carrinhoObj = json.decode(carrinho);
                                          }

                                          carrinhoObj.insert(0, {"Mussarela": 50});
                                          carrinhoObj.insert(0, {"Chocolate": 30});
                                          carrinhoObj.insert(0, {"Coca": 10});

                                          widget.storage.setItem('carrinho', json.encode(carrinhoObj));
                                          showAlertDialog(context);
                                        },
                                        color: Colors.red,
                                        textColor: Colors.white,
                                        padding: EdgeInsets.all(8.0),
                                        splashColor: Colors.grey,
                                      ),
                                    )),
                              ],
                            ),
                          )))
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(blurRadius: 34)
                      ],
                      color: Colors.red,
                      //image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/l.jpg'))
                    ),
                    height: 230,
                    width: 230,
                    child: Container(decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/c2.jpg')))),
                  ),
                  ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 580, maxWidth: 300),
                      //child: FittedBox(
                      //child: Text("Olá, sou o Flávio, tenho 20 anos, natural de Maués, Amazonas, e essa é uma ótima biografia.'"),
                      //),
                      child: Container(
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  "COMBO 2",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 PIZZA MEIA CALABRESA MEIA PORTUGUESA",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 PIZZA DE CHOCOLATE",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 COCA 2 LITROS",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- R\$ 90 ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 300, // <-- Your height
                                      child: RaisedButton(
                                        child: Text(
                                          "Enviar para o carrinho",
                                          style: TextStyle(fontSize: 27),
                                        ),
                                        onPressed: () {

                                          var carrinho = widget.storage.getItem('carrinho');

                                          List carrinhoObj = [];

                                          if (carrinho != null && carrinho.length > 0) {
                                            carrinhoObj = json.decode(carrinho);
                                          }

                                          carrinhoObj.insert(0, {"Meia Calabresa Meia Portuguesa": 50});
                                          carrinhoObj.insert(0, {"Chocolate": 30});
                                          carrinhoObj.insert(0, {"Coca": 10});

                                          widget.storage.setItem('carrinho', json.encode(carrinhoObj));
                                          showAlertDialog(context);
                                        },
                                        color: Colors.red,
                                        textColor: Colors.white,
                                        padding: EdgeInsets.all(8.0),
                                        splashColor: Colors.grey,
                                      ),
                                    )),
                              ],
                            ),
                          )))
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(blurRadius: 34)
                      ],
                      color: Colors.red,
                      //image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/l.jpg'))
                    ),
                    height: 230,
                    width: 230,
                    child: Container(decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/c3.jpg')))),
                  ),
                  ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 580, maxWidth: 300),
                      //child: FittedBox(
                      //child: Text("Olá, sou o Flávio, tenho 20 anos, natural de Maués, Amazonas, e essa é uma ótima biografia.'"),
                      //),
                      child: Container(
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  "COMBO 3",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 PIZZA DE MORANGO",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 PIZZA DE ESTROGONOFF DE CARNE",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- 1 COCA 2 LITROS",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "- R\$ 100 ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 300, // <-- Your height
                                      child: RaisedButton(
                                        child: Text(
                                          "Enviar para o carrinho",
                                          style: TextStyle(fontSize: 27),
                                        ),
                                        onPressed: () {
                                          var carrinho = widget.storage.getItem('carrinho');

                                          List carrinhoObj = [];

                                          if (carrinho != null && carrinho.length > 0) {
                                            carrinhoObj = json.decode(carrinho);
                                          }

                                          carrinhoObj.insert(0, {"Morango": 60});
                                          carrinhoObj.insert(0, {"Chocolate": 30});
                                          carrinhoObj.insert(0, {"Coca": 10});

                                          widget.storage.setItem('carrinho', json.encode(carrinhoObj));

                                          showAlertDialog(context);
                                        },
                                        color: Colors.red,
                                        textColor: Colors.white,
                                        padding: EdgeInsets.all(8.0),
                                        splashColor: Colors.grey,
                                      ),
                                    )),
                              ],
                            ),
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
