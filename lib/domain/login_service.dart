import 'package:http/http.dart' as http;

class LoginService {

  static Future<bool> call(login, password) async {

    final url = 'http://livrowebservices.com.br/rest/login';
    final response = await http.post(url, body: {'login': login, 'senha': password});
    final body = response.body;
    final status = response.statusCode;

    if(status != 200) {
      return false;
    }
    
    return true;
  }
}