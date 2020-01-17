import 'package:sa_flutter/models/instructionstep.dart';
import 'package:sa_flutter/models/recipe_details.dart';

class Recipe {
  RecipeDetails details;
  List<Instructionstep> instructionsteps;

  Recipe({this.details, this.instructionsteps});

  factory Recipe.fromMap(Map<String, dynamic> map) {
    if (map != null && map.isNotEmpty) {
      return Recipe(
          details: map['recipe'], instructionsteps: map['instructionsteps']);
    }
    return null;
  }
}
