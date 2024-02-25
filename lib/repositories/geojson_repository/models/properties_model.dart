class Properties {
  final String iconImage;
  final String textField;
  final String fillColor;
  final int circleRadius;
  final int circleStrokeWidth;
  final String circleStrokeColor;
  final String nama;
  final String status;
  final String angka;

  Properties({
    required this.iconImage,
    required this.textField,
    required this.fillColor,
    required this.circleRadius,
    required this.circleStrokeWidth,
    required this.circleStrokeColor,
    required this.nama,
    required this.status,
    required this.angka,
  });

  Properties copyWith({
    String? iconImage,
    String? textField,
    String? fillColor,
    int? circleRadius,
    int? circleStrokeWidth,
    String? circleStrokeColor,
    String? nama,
    String? status,
    String? angka,
  }) =>
      Properties(
        iconImage: iconImage ?? this.iconImage,
        textField: textField ?? this.textField,
        fillColor: fillColor ?? this.fillColor,
        circleRadius: circleRadius ?? this.circleRadius,
        circleStrokeWidth: circleStrokeWidth ?? this.circleStrokeWidth,
        circleStrokeColor: circleStrokeColor ?? this.circleStrokeColor,
        nama: nama ?? this.nama,
        status: status ?? this.status,
        angka: angka ?? this.angka,
      );

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        iconImage: json["icon_image"],
        textField: json["text_field"],
        fillColor: json["fill_color"],
        circleRadius: json["circle_radius"],
        circleStrokeWidth: json["circle_stroke_width"],
        circleStrokeColor: json["circle_stroke_color"],
        nama: json["Nama"],
        status: json["Status"],
        angka: json["Angka"],
      );

  Map<String, dynamic> toJson() => {
        "icon_image": iconImage,
        "text_field": textField,
        "fill_color": fillColor,
        "circle_radius": circleRadius,
        "circle_stroke_width": circleStrokeWidth,
        "circle_stroke_color": circleStrokeColor,
        "Nama": nama,
        "Status": status,
        "Angka": angka,
      };
}
