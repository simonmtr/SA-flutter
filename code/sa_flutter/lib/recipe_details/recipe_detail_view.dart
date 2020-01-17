import 'package:flutter/material.dart';
import 'package:sa_flutter/models/instructionstep.dart';
import 'package:sa_flutter/models/recipe.dart';
import 'package:sa_flutter/recipe_details/custom_sliver_app_bar.dart';
import 'package:sa_flutter/utils/image_url_generator.dart';
import 'package:sa_flutter/widgets/instruction_step_entry.dart';

class RecipeDetailView extends StatelessWidget {
  Recipe recipe;

  RecipeDetailView(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CustomSliverAppBar(
                  ImageUrlGenerator.getRecipeUrl(
                      recipe.details.id, "636x393", recipe.details.image),
                  Text(
                    recipe.details.title,
                    style: TextStyle(fontSize: 15, shadows: [
                      Shadow(
                        offset: Offset(0.0, 2.0),
                        blurRadius: 4.0,
                        color: Colors.black54,
                      )
                    ]),
                  ))
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.alarm),
                        Text(
                            'Duration: ${recipe.details.readyInMinutes} minutes')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.people),
                        Text('Servings: ${recipe.details.servings} portions')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text('Instructions:', style: TextStyle(fontSize: 35, fontFamily: 'DancingScript')),
                  ),
                  _instructionSteps(recipe.instructionsteps)
                ],
              ),
            ),
          )),
    ));
  }

  Widget _instructionSteps(List<Instructionstep> steps) {
    return Column(
        children:
            List.generate(steps.length, (i) => InstructionStepEntry(steps[i])));
  }
}
