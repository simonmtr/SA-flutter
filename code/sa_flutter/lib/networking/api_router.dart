class ApiRouter {
  static const baseUrl = "https://api.spoonacular.com";
  static const apiKey = "c26fcf986cec4ed7a4ac7538a2e09532";
  static const apiKeySimon = "ec4ed7bf325b4c6883b5eaed84810a44";
  static const String maxNumberShown = "10";

  ApiRouter();

  Future<String> requestRecipeBySearchstring(
      String stringToSearchReciptyBy) async {
    return baseUrl +
        "/recipes/search?query=" +
        stringToSearchReciptyBy +
        "&number=" +
        maxNumberShown +
        "&apiKey=" +
        apiKeySimon;
  }

  Future<String> requestAnalyzedInstructionById(String searchbyid) async {
    return baseUrl +
        "/recipes/" +
        searchbyid +
        "/analyzedInstructions" +
        "?apiKey=" +
        apiKeySimon;
  }
}
