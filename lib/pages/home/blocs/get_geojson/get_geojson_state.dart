part of 'get_geojson_bloc.dart';

@immutable
sealed class GetGeojsonState {}

final class GetGeojsonInitial extends GetGeojsonState {}

final class GetGeojsonSuccess extends GetGeojsonState {
  final List<GeoData> data;

  GetGeojsonSuccess({required this.data});
}

final class GetGeojsonLoading extends GetGeojsonState {}

final class GetGeojsonError extends GetGeojsonState {
  final String error;

  GetGeojsonError({required this.error});
}
