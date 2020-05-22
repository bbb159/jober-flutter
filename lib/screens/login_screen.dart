import 'package:flutter/material.dart';
import 'package:jober/screens/sign_up/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jober",
          style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 150),
              Text(
                'Bem vindo!',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                padding: const EdgeInsets.symmetric(vertical: 15),
                color: Colors.deepPurpleAccent,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Esqueceu a senha?',
                  style:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Center(
                  child: Text(
                    'ENTRE COM',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[350],
                        letterSpacing: 1.5),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 150,
                    child: OutlineButton(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 30, top: 15, bottom: 15),
                            child: Image.asset(
                              'images/icons/ic-google-64.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          Text(
                            'Google',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent, fontSize: 14),
                          )
                        ],
                      ),
                      onPressed: () {},
                      borderSide: BorderSide(color: Colors.grey[100]),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: OutlineButton(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 30, top: 15, bottom: 15),
                            child: Image.asset(
                              'images/icons/ic-facebook-48.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 14),
                          )
                        ],
                      ),
                      onPressed: () {},
                      borderSide: BorderSide(color: Colors.grey[100]),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      'Não possui conta?',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  Text(
                    'Criar conta',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
