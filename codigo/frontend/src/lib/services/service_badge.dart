import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'service_post.dart';


void main() {
  runApp(MyApp());
  getAllPosts().then((data) {
    print(data);
  }).catchError((error) {
    print('Erro: $error');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Consumo de API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<dynamic>> fetchData() async {
    var url = Uri.parse('http://load-novo-336193150.us-east-1.elb.amazonaws.com/user');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        return jsonData;
      } else {
        throw Exception('Erro na requisição: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de Consumo de API'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Dados recebidos com sucesso
            var jsonData = snapshot.data;
            
            // Exemplo de como acessar os valores do JSON
            var firstItem = jsonData![0];
            var fieldValue = firstItem['name'];

            return Center(
              child: Text('Valor do campo: $fieldValue'),
            );
          } else if (snapshot.hasError) {
            // Tratamento de erro
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          }

          // Aguardando dados
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
