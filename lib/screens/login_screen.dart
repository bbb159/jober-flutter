import 'package:flutter/material.dart';

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
      body: Container(
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[300],
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[300],
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true),
            ),
            SizedBox(height: 20),
            RaisedButton(
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.deepPurpleAccent,
              onPressed: () {},
              child: Text(
                'Entrar',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 14),
              ),
            ),
            SizedBox(height: 50),
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
                          'Google',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 14),
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
    );
  }
}
