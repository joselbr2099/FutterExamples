import 'package:flutter/material.dart';
import 'album.dart';
//import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //se define un atributo de tipo late ya que esta se inicializará mas adelante
  late Album album;
  String titulo = "";

  //metodo que se ejecuta para obtener el titulo desde el servidor
  void _getAlbum() async {
    //async es para que el metodo sea asincrono
    album = await fetchAlbum(); //se obtiene el album desde el servidor
    titulo = album.title; //se obtiene el titulo del album
    setState(() {}); //se actualiza el estado de la aplicacion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("titulo ${titulo}", style: TextStyle(fontSize: 40)),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getAlbum,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*
 //realizamos en envio
        final http.Response response = await http.post(url+'Resumen',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': "Bearer $token",
          },
          body: jsonEncode(resumen),
        ).timeout(Duration(seconds: 5));
*/
