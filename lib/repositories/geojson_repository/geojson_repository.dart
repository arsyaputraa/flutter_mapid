import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mapid_flutter/repositories/geojson_repository/models/geodata_model.dart';

class GeoJsonRepository {
  Future<List<GeoData>> getGeoData() async {
    try {
      var result = await http.get(Uri.parse(
          "https://geoserver.mapid.io/layers_new/get_layer?api_key=689c2279e0834a3ba82743432605e746&layer_id=628f1d7c84b953e79a7cd896&project_id=611eafa6be8a2635e15c4afc#"));
      return (jsonDecode(result.body)['geojson']['features'] as List)
          .map<GeoData>((item) => GeoData.fromJson(item))
          .toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
