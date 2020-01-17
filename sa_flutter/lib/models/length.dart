class Length {
  int number;
  String unit;

  Length({this.number, this.unit});

  factory Length.fromMap(Map<String, dynamic> map) {
    if (map!= null && map.isNotEmpty) {
      return Length(number: map['number'], unit: map['unit']);
    }
    return null;
  }
}
