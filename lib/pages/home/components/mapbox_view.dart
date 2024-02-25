import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapid_flutter/pages/home/components/custom_marker_item.dart';
import 'package:mapid_flutter/pages/home/components/marker_info.dart';
import 'package:mapid_flutter/repositories/geojson_repository/models/geodata_model.dart';

class MapboxView extends StatelessWidget {
  final List<GeoData> geoData;
  MapboxView({super.key, required this.geoData});
  final PopupController _popupLayerController = PopupController();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(-6.930715359516865, 107.65637547637245),
        initialZoom: 11.7,
        onTap: (_, __) => _popupLayerController.hideAllPopups(),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        PopupMarkerLayer(
          options: PopupMarkerLayerOptions(
            markers:
                geoData.map((item) => CustomMarkerItem(data: item)).toList(),
            popupController: _popupLayerController,
            popupDisplayOptions: PopupDisplayOptions(
              snap: PopupSnap.markerTop,
              builder: (_, Marker marker) {
                if (marker is CustomMarkerItem) {
                  return MarkerInfo(property: marker.data.properties);
                }
                return const Card(child: Text('No Data'));
              },
            ),
          ),
        ),
      ],
    );
  }
}
