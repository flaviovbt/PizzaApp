import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RestServer {
  static RestServer helper = RestServer._createInstance();

  RestServer._createInstance();

  final Dio _dio = Dio();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String prefixUrl = "https://si7001s2022-58d23-default-rtdb.firebaseio.com/";
  String suffixUrl = "/.json";

  Future<int?> postOrPutUser(body) async {
    String userKey = await checkIfUserExists(body['email']);

    if (userKey != null && userKey.length > 0) {
      Response response = await _dio.put(prefixUrl + "/" + userKey + suffixUrl, data: body);
      return response.statusCode;
    } else {
      Response response = await _dio.post(prefixUrl + suffixUrl, data: body);
      return response.statusCode;
    }
  }

  Future<int?> postOrPutUserDataCloudFirestore(body) async {

    final uid = auth.currentUser!.uid;

    var userData = {
      'name': body['nome'],
      'email': body['email'],
      'telefone': body['telefone'],
      'cep': body['cep'],
      'bairro' : body['bairro'],
      'rua' : body['rua'],
      'numero' : body['numero']
    };

    FirebaseFirestore.instance.collection('users').doc(uid).set(userData, SetOptions(merge: true))
        .then((_) => print('Success')).catchError((error) => print('Failed: $error'));

  }

  Future<Object?> getCurrentUserData() async {
    final uid = auth.currentUser!.uid;
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return doc.data();
  }

  checkIfUserExists(String? email) async {
    Response response = await _dio.get(prefixUrl + suffixUrl);
    String id = "";

    try {
      response.data.forEach((key, item) => {
        if (item['email'] == email)
          {
            id = key
          }
      });
    } catch (err) {}
    return id;
    print(id);
  }
}
