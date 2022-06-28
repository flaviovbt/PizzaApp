import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    return Form(
        key: formkey,
        child: Container(
          padding: EdgeInsets.all(22.0),
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
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
              Text("Pizza App", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Colors.red,
                      ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Informe um email para cadastro',
                    labelText: 'Email *',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (String? inValue) {
                    if (inValue!.isEmpty) {
                      return "Insira algo como email";
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {
                    username = inValue!;
                  },
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Colors.red,
                      ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Crie uma senha secreta',
                    labelText: 'Senha *',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  obscureText: true,
                  validator: (String? inValue) {
                    if (inValue!.length < 4) {
                      return "Tem que ter ao menos 4 caracters";
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {
                    password = inValue!;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    // Lançando evento
                    BlocProvider.of<AuthBloc>(context).add(RegisterUser(username: username, password: password));
                  }
                },
                child: const Text("Registrar"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ],
          ),
        ));
  }
}
