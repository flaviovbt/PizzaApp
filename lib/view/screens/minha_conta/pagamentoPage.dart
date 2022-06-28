import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../meus_pedidos/aguardandoPedidoPage.dart';

class PagamentoPage extends StatefulWidget {
  final LocalStorage storage;
  const PagamentoPage({Key? key, required this.storage}) : super(key: key);

  @override
  State<PagamentoPage> createState() => _PagamentoPage();
}

class _PagamentoPage extends State<PagamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://br.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/core_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png'),
            Text("Pague o PIX para confirmar a compra"),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50, // <-- Your height
        child: RaisedButton(
          child: Text(
            "IR PARA TELA DE AGUARDANDO PEDIDO",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AguardandoPedidoPage(storage: widget.storage),
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
