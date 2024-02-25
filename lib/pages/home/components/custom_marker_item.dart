import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapid_flutter/repositories/geojson_repository/models/geodata_model.dart';

class CustomMarkerItem extends Marker {
  CustomMarkerItem({required this.data})
      : super(
          alignment: Alignment.topCenter,
          height: data.properties.circleRadius.toDouble() * 3,
          width: data.properties.circleRadius.toDouble() * 3,
          point: LatLng(
              data.geometry.coordinates[1], data.geometry.coordinates[0]),
          child: Container(
            decoration: BoxDecoration(
              color: data.properties.status == 'Merah'
                  ? Colors.red[900]
                  : data.properties.status == 'Hijau'
                      ? Colors.green[900]
                      : Colors.yellow[700],
              shape: BoxShape.circle,
            ),
          ),
        );

  final GeoData data;
}
