import 'equipment.dart';
import 'ingredient.dart';
import 'length.dart';

class Instructionstep {
  List<Equipment> equipment;
  List<Ingredient> ingredients;
  String step;
  int number;
  Length length;

  Instructionstep({this.equipment, this.ingredients, this.step, this.number, this.length});

  factory Instructionstep.fromMap(Map<String, dynamic> map) {
    if (map!= null && map.isNotEmpty) {
      var equipmentListDynamic = map['equipment'] as List;
      List<Equipment> equipmentList =
          equipmentListDynamic.map((i) => Equipment.fromMap(i)).toList();
      var ingredientListDynamic = map['ingredients'] as List;
      List<Ingredient> ingredientList =
          ingredientListDynamic.map((i) => Ingredient.fromMap(i)).toList();
      return Instructionstep(
          equipment: equipmentList,
          ingredients: ingredientList,
          step: map['step'],
          number: map['number'],
          length: Length.fromMap(map['length']));
    }
    return null;
  }
}
