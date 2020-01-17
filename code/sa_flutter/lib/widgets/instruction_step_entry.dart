import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sa_flutter/models/instructionstep.dart';
import 'package:sa_flutter/widgets/image_grid.dart';

class InstructionStepEntry extends StatelessWidget {
  Instructionstep instructionStep;

  InstructionStepEntry(this.instructionStep);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text('${instructionStep.number.toString()}.',
                style: TextStyle(fontSize: 35, fontFamily: 'DancingScript')),
          ),
          Divider(height: 16, thickness: 2, indent: 32),
          Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 32, right: 8, bottom: 16),
            child: Text(instructionStep.step, style: TextStyle(fontSize: 18)),
          ),
          ImageGrid(instructionStep.equipment, GridType.EQUIPMENT),
          ImageGrid(instructionStep.ingredients, GridType.INGREDIENT)
        ],
      ),
    );
  }
}
