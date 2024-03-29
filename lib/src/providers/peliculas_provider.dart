import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;


class PeliculasProvider {
  String _apikey    = 'f0988acfb81ed0b5736a8bb7096b2324';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-MX';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  : _apikey,
      'language' : _language
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    
    return peliculas.items;

  }
}