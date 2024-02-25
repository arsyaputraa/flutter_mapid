import 'package:bloc/bloc.dart';
import 'package:mapid_flutter/repositories/geojson_repository/geojson_repository.dart';
import 'package:mapid_flutter/repositories/geojson_repository/models/geodata_model.dart';
import 'package:meta/meta.dart';

part 'get_geojson_event.dart';
part 'get_geojson_state.dart';

class GetGeojsonBloc extends Bloc<GetGeojsonEvent, GetGeojsonState> {
  final GeoJsonRepository _geoJsonRepository;
  GetGeojsonBloc(GeoJsonRepository geoJsonRepository)
      : _geoJsonRepository = geoJsonRepository,
        super(GetGeojsonInitial()) {
    on<GetGeoJsonRequired>((GetGeoJsonRequired event, Emitter emit) async {
      emit(GetGeojsonLoading());
      try {
        List<GeoData> data = await _geoJsonRepository.getGeoData();
        emit(GetGeojsonSuccess(data: data));
      } catch (e) {
        emit(GetGeojsonError(error: e.toString()));
      }
    });
  }
}
