import 'package:flutter/material.dart';
import '../../../provider/account_info.dart';

class MinhaContaRoute extends StatefulWidget {

  const MinhaContaRoute({Key? key}) : super(key: key);

  @override
  _MinhaContaRouteState createState() => _MinhaContaRouteState();
}

class _MinhaContaRouteState extends State<MinhaContaRoute> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;
  String? nome;
  String? telefone;
  String? cep;
  String? bairro;
  String? rua;
  String? numero;
  var currentUser;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  final cepController = TextEditingController();
  final bairroController = TextEditingController();
  final ruaController = TextEditingController();
  final numeroController = TextEditingController();



  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nameController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    cepController.dispose();
    bairroController.dispose();
    ruaController.dispose();
    numeroController.dispose();

    super.dispose();
  }

  /*
  void _printLatestValue() {
    print('Second text field:  ${myController.text}');
  }
  */

  @override
  void initState() {
    super.initState();
    loadUser();
    // Start listening to changes.
    //emailController.addListener(_printLatestValue);

  }

  void loadUser() async {
    currentUser = await RestServer.helper.getCurrentUserData();
    final Map<String, dynamic> data = Map.from(currentUser);
    print(currentUser);
    var  name = data['name'];
    var  email = data['email'];
    var  telefone = data['telefone'];
    var  cep = data['cep'];
    var  bairro = data['bairro'] ;
    var  rua = data['rua'];
    var  numero =  data['numero'];

    //print(data['email']);

    nameController.text = name ?? '';
    emailController.text = email ?? '';
    telefoneController.text = telefone ?? '';
    cepController.text = cep ?? '';
    bairroController.text = bairro ?? '';
    ruaController.text = rua ?? '';
    numeroController.text = numero ?? '';
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha conta'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: wid(),
            )),
      ),
    );
  }

  List<Widget> wid() {
    return [
      Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(children: [

              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                child: Icon(Icons.person, color: Colors.white),
              ),
              //Text('Rodolfinho Zika')
            ]),
          )),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                onChanged: (String? value) {
                  nome = value;
                },
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Juvenal",
                  labelText: "Nome",
                  labelStyle: new TextStyle(color: Colors.black),
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
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Escreva algo";
                    } else {
                      return null;
                    }
                  } else {
                    return "Algo errado ocorreu";
                  }
                },
              ),
              TextFormField(
                onChanged: (String? value) {
                  telefone = value;
                },
                controller: telefoneController,
                decoration: InputDecoration(
                  hintText: "11 1 1111 1111",
                  labelText: "Telefone",
                  labelStyle: new TextStyle(color: Colors.black),
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
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Escreva algo";
                    } else {
                      return null;
                    }
                  } else {
                    return "Algo errado ocorreu";
                  }
                },
              ),
              TextFormField(
                onChanged: (String? value) {
                  cep = value;
                },
                controller: cepController,
                decoration: InputDecoration(
                  hintText: "11111111",
                  labelText: "CEP",
                  labelStyle: new TextStyle(color: Colors.black),
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
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Escreva algo";
                    } else {
                      return null;
                    }
                  } else {
                    return "Algo errado ocorreu";
                  }
                },
              ),
              TextFormField(
                onChanged: (String? value) {
                  bairro = value;
                },
                controller: bairroController,
                decoration: InputDecoration(
                  hintText: "Penha",
                  labelText: "Bairro",
                  labelStyle: new TextStyle(color: Colors.black),
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
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Escreva algo";
                    } else {
                      return null;
                    }
                  } else {
                    return "Algo errado ocorreu";
                  }
                },
              ),
              TextFormField(
                onChanged: (String? value) {
                  rua = value;
                },
                controller: ruaController,
                decoration: InputDecoration(
                  hintText: "Rua Cláudio Maderada",
                  labelText: "Rua",
                  labelStyle: new TextStyle(color: Colors.black),
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
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Escreva algo";
                    } else {
                      return null;
                    }
                  } else {
                    return "Algo errado ocorreu";
                  }
                },
              ),
              TextFormField(
                onChanged: (String value) {
                  numero = value;
                },
                controller: numeroController,
                decoration: InputDecoration(
                  hintText: "1111",
                  labelText: "Número",
                  labelStyle: new TextStyle(color: Colors.black),
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
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Escreva algo";
                    } else {
                      return null;
                    }
                  } else {
                    return "Algo errado ocorreu";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  child: Text(
                    "Salvar",
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Realizar ação
                      var reqBody = {};
                      reqBody["nome"] = nameController.text;
                      reqBody["telefone"] = telefoneController.text;
                      reqBody["cep"] = cepController.text;
                      reqBody["bairro"] = bairroController.text;
                      reqBody["rua"] = ruaController.text;
                      reqBody["numero"] = numeroController.text;

                      RestServer.helper.postOrPutUser(reqBody);
                      RestServer.helper.postOrPutUserDataCloudFirestore(reqBody);
                      //print(reqBody);
                    }
                  },
                ),
              ),
            ])),
      )
    ];
  }
}
