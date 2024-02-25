import 'package:mapid_flutter/repositories/geojson_repository/models/geometry_model.dart';
import 'package:mapid_flutter/repositories/geojson_repository/models/properties_model.dart';

class GeoData {
  final Geometry geometry;
  final Properties properties;
  final String key;

  GeoData({
    required this.geometry,
    required this.properties,
    required this.key,
  });

  GeoData copyWith({
    Geometry? geometry,
    Properties? properties,
    String? key,
  }) =>
      GeoData(
        geometry: geometry ?? this.geometry,
        properties: properties ?? this.properties,
        key: key ?? this.key,
      );

  factory GeoData.fromJson(Map<String, dynamic> json) => GeoData(
        geometry: Geometry.fromJson(json["geometry"]),
        properties: Properties.fromJson(json["properties"]),
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry.toJson(),
        "properties": properties.toJson(),
        "key": key,
      };
}
