import 'dart:convert';

import 'package:flutter/material.dart';
import './pagamentoPage.dart';
import 'package:localstorage/localstorage.dart';

class PedidosRoute extends StatefulWidget {
  final LocalStorage storage;
  const PedidosRoute({Key? key, required this.storage}) : super(key: key);

  @override
  State<PedidosRoute> createState() => _PedidosRoute();
}

class _PedidosRoute extends State<PedidosRoute> {

  List<Widget> widgetList = [];


  num total = 0;


  @override
  Widget build(BuildContext context) {



    List<Widget> loadWidgets (){
      total = 0;
      var listWidgets = <Widget>[];

      var widgetsList = json.decode(widget.storage.getItem('carrinho'));

      for(var i=0;i<widgetsList.length;i++){
        String key = widgetsList[i].keys.toList()[0];
        num value = widgetsList[i][key];

        print(i);
        print(widgetsList);
        total += value;
        listWidgets.insert(0, ListTile(
          leading: Icon(Icons.local_pizza),
          title: Text(key + ' - R\$' + value.toString()),
          trailing: Column(
            children: <Widget>[
              FlatButton(child: Text('REMOVER'), onPressed: () {
                widgetsList.removeAt(0);
                widget.storage.setItem('carrinho', json.encode(widgetsList));
                loadWidgets();
              })
            ],
          ),
        ));
      }

      listWidgets.add(ListTile(
        leading: Icon(Icons.payment),
        title: Text('TOTAL R\$ ' + total.toString()),
      ));

      setState(() {
        widgetList = listWidgets;
      });


      return listWidgets;

    }

    loadWidgets();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: widgetList,
      ),
      bottomNavigationBar: SizedBox(
        height: 50, // <-- Your height
        child: RaisedButton(
          child: Text(
            "Ir para pagamento",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PagamentoPage(storage: widget.storage),
              ),
            );
          },
          color: Colors.red,
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.grey,
        ),
      ),
    );
  }
}
