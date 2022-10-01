class CardInfo {
  final String? svgSrc, title, unit;
  final int? value, percentage, color;

  CardInfo({
    this.svgSrc,
    this.title,
    this.value,
    this.percentage,
    this.color,
    this.unit
  });

  static CardInfo fromJson(Map<String, dynamic> map) {
    return CardInfo(
      title: map['title'].toString(),
      value: int.tryParse(map['value']),
      svgSrc: map['svgSrc'].toString(),
      color: int.tryParse(map['color']),
      percentage: int.tryParse(map['percentage']),
      unit: map['unit'].toString()
    );
  }
}