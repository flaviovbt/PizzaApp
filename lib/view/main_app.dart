import 'package:flutter/material.dart';
import '../view/screens/cardapio/cardapioPage.dart';


class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(blurRadius: 34)
                  ],
                  color: Colors.red,
                  //image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/l.jpg'))
                ),
                height: 230,
                width: 230,
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/logo.jpg')))),
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
                              "Bem Vindo ao Pizza App",
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            new Text(
                              "Faça seu pedido agora mesmo.",
                              style: TextStyle(
                                fontSize: 27,
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
                                      "Acessar o Cardápio",
                                      style: TextStyle(fontSize: 27),
                                    ),
                                    onPressed: () {
                                      //Navigator.push(
                                      //  context,
                                      //  MaterialPageRoute(
                                      //    builder: (context) => CardapioRoute(),
                                      //  ),
                                      //);
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
        );
  }
}
