import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_event.dart';
import 'login_screen.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

import 'main_app.dart';
import 'register_screen.dart';

import '../view/screens/cardapio/cardapioPage.dart';
import '../view/screens/meus_pedidos/aguardandoPedidoPage.dart';
import '../view/screens/minha_conta/minhaContaPage.dart';
import '../view/screens/minha_conta/pagamentoPage.dart';
import '../view/screens/minha_conta/pedidosPage.dart';
import '../view/screens/promocoes/promocoesPage.dart';
import 'package:localstorage/localstorage.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  int currentScreen = 1;

  final LocalStorage storage = new LocalStorage('localstorage_app');
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("PizzaApp"),
                centerTitle: true,
                backgroundColor: Colors.red,
              ),
              drawer: Drawer(
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.white30),
                      child: Column(children: [
                        CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.person),
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(height: 10),
                        Text('Matheus Marques')
                      ]),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text('Meus Pedidos'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PedidosRoute(storage: storage),
                          ),
                        );
                      },
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text('Minha conta'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MinhaContaRoute(),
                          ),
                        );
                      },
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Cardápio'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardapioRoute(storage: storage, showHeader: true),
                          ),
                        );
                      },
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      leading: Icon(Icons.bookmark),
                      title: Text('Promoções'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PromocoesRoute(storage: storage),
                          ),
                        );
                      },
                    ),
                    Divider(thickness: 1),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(Logout());
                },
                child: const Icon(Icons.logout),
                backgroundColor: Colors.red,
              ),
              body: CardapioRoute(storage: storage, showHeader: false));
        } else {
          return //LoginScreen();

              DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    body: IndexedStack(index: currentScreen, children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            RegisterScreen(),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  currentScreen = 1;
                                });
                              },
                              child: const Text("Já tem uma conta?", style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            LoginScreen(),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  currentScreen = 0;
                                });
                              },
                              child: const Text("Ainda não tem uma conta?", style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      ),
                      /*const TabBarView(
                      children: [
                        RegisterScreen(),
                        LoginScreen()
                      ],
                    ),*/
                    ]),
                    appBar: AppBar(
                      title: const Text("Pizza App"),
                      centerTitle: true,
                      backgroundColor: Colors.red,
                    ),
                  ));
        }
      },
    );
  }
}
