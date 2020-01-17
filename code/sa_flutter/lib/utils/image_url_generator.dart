class ImageUrlGenerator {

  static String getRecipeUrl(int recipeID, String size, String rawUrl) {
    String imageType;
    if (rawUrl.contains('.jpg') || rawUrl.contains('.jpeg')) {
      imageType = "jpg";
    } else {
      imageType = "png";
    }
    return "https://spoonacular.com/recipeImages/" +
        recipeID.toString() +
        '-' +
        size +
        '.' +
        imageType;
  }

  static String getEquipmentUrl(String baseUrl, String size) {
    return "https://spoonacular.com/cdn/equipment_" + size + "/" + baseUrl;
  }

  static String getIngredientUrl(String baseUrl, String size) {
    return "https://spoonacular.com/cdn/ingredients_" + size + "/" + baseUrl;
  }

  String getImageType(String rawUrl) {
    if (rawUrl.contains('.jpg') || rawUrl.contains('.jpeg')) {
      return "jpg";
    } else {
      return "png";
    }
  }
}
