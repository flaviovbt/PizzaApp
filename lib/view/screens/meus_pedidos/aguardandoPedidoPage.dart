import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../../main_app.dart';
import '../../wrapper.dart';

class AguardandoPedidoPage extends StatefulWidget {
  final LocalStorage storage;
  const AguardandoPedidoPage({Key? key, required this.storage}) : super(key: key);

  @override
  State<AguardandoPedidoPage> createState() => _AguardandoPedidoPage();
}

class _AguardandoPedidoPage extends State<AguardandoPedidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aguardando Pagamento'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Seu pagamento foi confirmado,"),
            Text("agora é só aguardar seu pedido chegar."),
            Icon(
              Icons.local_pizza,
              color: Colors.green,
              size: 30.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80, // <-- Your height
        child: ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      widget.storage.setItem('carrinho', '[]');
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Text("Confirmar entrega"),
                    color: Colors.green,
                    textColor: Colors.white,
                  )),
              Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      widget.storage.setItem('carrinho', '[]');
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Text("Cancelar"),
                    color: Colors.red,
                    textColor: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
