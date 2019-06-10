import 'dart:convert';
import 'package:carros/domain/response.dart';
import 'package:http/http.dart' as http;

class LoginService {

  static Future<Response> call(login, password) async {
    final url = 'http://livrowebservices.com.br/rest/login';
    final response = await http.post(
        url, body: {'login': login, 'senha': password});
    final body = response.body;

    return Response.fromJson(json.decode(body));
  }
}