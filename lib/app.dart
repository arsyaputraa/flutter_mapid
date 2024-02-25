import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapid_flutter/app_view.dart';
import 'package:mapid_flutter/pages/home/blocs/get_geojson/get_geojson_bloc.dart';
import 'package:mapid_flutter/repositories/geojson_repository/geojson_repository.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GeoJsonRepository(),
      child: BlocProvider(
        create: (context) => GetGeojsonBloc(context.read<GeoJsonRepository>())
          ..add(GetGeoJsonRequired()),
        child: const AppView(),
      ),
    );
  }
}
