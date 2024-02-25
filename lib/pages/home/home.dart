import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapid_flutter/pages/home/blocs/get_geojson/get_geojson_bloc.dart';
import 'package:mapid_flutter/pages/home/components/mapbox_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetGeojsonBloc, GetGeojsonState>(
        builder: (context, state) {
          if (state is GetGeojsonLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetGeojsonError) {
            return const Center(
              child: Text('error'),
            );
          }
          if (state is GetGeojsonSuccess) {
            return MapboxView(
              geoData: state.data,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
