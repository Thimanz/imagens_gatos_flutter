import 'dart:convert';

import 'package:image_generator/src/models/image_model.dart';
import 'package:image_generator/src/widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppState extends State<App> {
  int currentPage = 1;
  List<ImageModel> imagens = [];

  void obterImagem() async {
    var request = http.Request(
        'get',
        Uri.https('api.thecatapi.com', 'v1/images/search',
            {'page': '$currentPage', 'limit': '5'}));
    request.headers.addAll({
      'x-api-key': '' //api key
    });
    final result = await request.send();
    if (result.statusCode == 200) {
      final response = await http.Response.fromStream(result);
      var decodedJSON = json.decode(response.body);
      List<ImageModel> fetchedImagens = List.empty(growable: true);
      for (int i = 0; i < 5; i++) {
        var imagem = ImageModel.fromJSON(decodedJSON[i]);
        fetchedImagens.add(imagem);
      }
      setState(() {
        currentPage++;
        imagens.addAll(fetchedImagens);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Gatos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: obterImagem,
        child: const Icon(Icons.add_a_photo_outlined),
      ),
      body: ImageList(imagens),
    ));
  }
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}
