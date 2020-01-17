class RecipeDetails {
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String image;

  RecipeDetails({this.id, this.title, this.readyInMinutes, this.servings, this.image});

  factory RecipeDetails.fromMap(Map<String, dynamic> map) {
    if (map != null && map.isNotEmpty) {
      return RecipeDetails(
          id: map["id"],
          title: map["title"],
          readyInMinutes: map["readyInMinutes"],
          servings: map["servings"],
          image: map["image"]);
    }
    return null;
  }
}
