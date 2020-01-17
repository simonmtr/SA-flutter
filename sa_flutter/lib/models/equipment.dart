class Equipment {
  int id;
  String name;
  //do not rename this field
  String image;

  Equipment({this.id, this.name, this.image});

  factory Equipment.fromMap(Map<dynamic, dynamic> map) {
    if (map != null && map.isNotEmpty) {
      return Equipment(id: map['id'], name: map['name'], image: map['image']);
    }
    return null;
  }
}
