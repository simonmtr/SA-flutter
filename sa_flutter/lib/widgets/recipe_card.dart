import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sa_flutter/models/recipe.dart';
import 'package:sa_flutter/recipe_details/recipe_detail_view.dart';
import 'package:sa_flutter/utils/image_url_generator.dart';

class RecipeCard extends StatelessWidget {
  Recipe recipe;

  RecipeCard(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      margin: EdgeInsets.only(top: 16.0, left: 8, right: 8),
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetailView(recipe)));
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(minHeight: 110.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        Icon(Icons.image, color: Colors.grey),
                    imageUrl: ImageUrlGenerator.getRecipeUrl(
                        recipe.details.id, "90x90", recipe.details.image)),
                height: 90,
                width: 90,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(recipe.details.title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          maxLines: 2),
                      IconTuple(Icons.timer, recipe.details.readyInMinutes),
                      IconTuple(Icons.people, recipe.details.servings)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconTuple extends StatelessWidget {
  IconData iconData;
  int amount;

  IconTuple(this.iconData, this.amount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            size: 20,
            color: Colors.grey,
          ),
          Text(
            ': ' + amount.toString(),
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
