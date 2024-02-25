import 'package:flutter/material.dart';
import 'package:mapid_flutter/repositories/geojson_repository/models/properties_model.dart';

class MarkerInfo extends StatelessWidget {
  final Properties property;
  const MarkerInfo({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomInfoClipper(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Nama',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                property.nama,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Status',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                property.status,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Angka',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                property.angka,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInfoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, h * 0.1);
    path.lineTo(0, h * 0.8);
    path.quadraticBezierTo(0, h * 0.9, w * 0.1, h * 0.9);
    path.lineTo(w / 2 - 20, h * 0.9);
    path.lineTo(w / 2, h);
    path.lineTo(w / 2 + 20, h * 0.9);
    path.lineTo(w * 0.9, h * 0.9);
    path.quadraticBezierTo(w, h * 0.9, w, h * 0.8);

    path.lineTo(w, h * 0.1);
    path.quadraticBezierTo(w, 0, w * 0.9, 0);
    path.lineTo(w * 0.1, 0);
    path.quadraticBezierTo(0, 0, 0, h * 0.1);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
