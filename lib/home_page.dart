import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _atualizar = "0";

  void _atualizarPreco() async {
    String url = "https://blockchain.info/ticker";

    http.Response response;

    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _atualizar = retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/bitcoin.png"),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 30),
            ),
            Text(
              "R\$  " + _atualizar,
              style: TextStyle(fontSize: 35),
            ),
            Padding(padding: EdgeInsets.only(bottom: 32)),
            RaisedButton(
              child: Text(
                "Atualizar",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: _atualizarPreco,
              color: Colors.orange,
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            )
          ],
        ),
      ),
    );
  }
}
