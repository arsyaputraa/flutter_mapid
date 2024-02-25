part of 'get_geojson_bloc.dart';

@immutable
sealed class GetGeojsonEvent {}

class GetGeoJsonRequired extends GetGeojsonEvent {}
