class Ingredient {
  int id;
  String name;
  //do not rename this field
  String image;

  Ingredient({this.id, this.name, this.image});

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    if (map!= null && map.isNotEmpty) {
      return Ingredient(id: map['id'], name: map['name'], image: map['image']);
    }
    return null;
  }
}
