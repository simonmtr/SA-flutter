import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sa_flutter/models/recipe.dart';
import 'package:sa_flutter/models/instructionstep.dart';
import 'package:sa_flutter/models/recipe_details.dart';

import 'api_router.dart';

class ApiClient {
  static final int _success = 200;
  final ApiRouter apiRouter = ApiRouter();

  Future<List<Recipe>> getRecipeAndInstructionsBySearchstring(
      {String searchString}) async {
    List<Recipe> fullRecipes = List();
    List<dynamic> recipes = List();
    List<dynamic> instructionsteps = List();
    await getRecipeBySearchstring(searchString: searchString).then((result) {
      recipes = result;
    });
    for (RecipeDetails recipe in recipes) {
      await getAnalyzedInstructionById(id: recipe.id.toString()).then((result) {
        instructionsteps = result;
        fullRecipes.add(
            Recipe(details: recipe, instructionsteps: instructionsteps));
      });
    }
    return fullRecipes;
  }

  Future<List<RecipeDetails>> getRecipeBySearchstring({String searchString}) async {
    List<RecipeDetails> recipes = List();
    var response = await http
        .get(await apiRouter.requestRecipeBySearchstring(searchString));

    if (response.statusCode == _success) {
      print('Successful Request');

      var responseBody = json.decode(response.body);
      if (responseBody.isNotEmpty) {
        for (Map<String, dynamic> map in responseBody['results']) {
          recipes.add(RecipeDetails.fromMap(map));
        }
      }
      return recipes;
    }
    return List();
  }

  Future<List<Instructionstep>> getAnalyzedInstructionById({String id}) async {
    List<Instructionstep> instructionSteps = List();
    var response =
        await http.get(await apiRouter.requestAnalyzedInstructionById(id));

    if (response.statusCode == _success) {
      print('Successful Request');

      List<dynamic> responseBody = json.decode(response.body);
      if (responseBody.isNotEmpty) {
        for (Map<String, dynamic> map in responseBody[0]['steps']) {
          instructionSteps.add(Instructionstep.fromMap(map));
        }
      }
      //DEBUG HERE TO SEE INSTRUCTIONSTEPLIST
      return instructionSteps;
    }
    return List();
  }
}
