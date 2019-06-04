
import 'package:carros/domain/login_service.dart';
import 'package:carros/utils/alerts.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: Padding(
        child: _body(context),
        padding: EdgeInsets.all(16),
      ),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _loginController,
            validator: _validateLogin,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.blue),
            decoration: InputDecoration(
                labelText: "Login",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                hintText: "Digite seu login",
                hintStyle: TextStyle(color: Colors.black54, fontSize: 18)
            ),
          ),
          TextFormField(
            controller: _passwordController,
            validator: _validatePassword,
            obscureText: true,
            keyboardType: TextInputType.number,

            style: TextStyle(color: Colors.blue),
            decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                hintText: "Digite sua senha",
                hintStyle: TextStyle(color: Colors.black54, fontSize: 18)
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Login", style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {_onClickLogin(context);}
            ),
          )
        ],
      ),
    );
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }

    return null;
  }

  String _validatePassword(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    if (text.length < 4) {
      return "Senha precisa ter no mínimo 4 números";
    }

    return null;
  }

  void _onClickLogin(BuildContext context) async {
    if(!_formKey.currentState.validate()) { return null; }

    final login = _loginController.text;
    final password = _passwordController.text;

    final validLogin = await LoginService.call(login, password);

    if(validLogin) {
      print("Foi login");
    }
    else {
      alert(context, "Erro", "Erro durante o login");
    }
  }
}
