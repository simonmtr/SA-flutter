import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sa_flutter/utils/image_url_generator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageGrid extends StatelessWidget {
  List<dynamic> elements;
  GridType type;

  ImageGrid(this.elements, this.type);

  @override
  Widget build(BuildContext context) {
    return elements.length == 0
        ? Container()
        : Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 72),
                  child: Text(
                      type == GridType.EQUIPMENT
                          ? "Equipment:"
                          : "Ingredients:",
                      style:
                          TextStyle(fontSize: 28, fontFamily: 'DancingScript')),
                ),
              ),
              Divider(height: 16, thickness: 2, indent: 72),
              Padding(
                padding: const EdgeInsets.only(left: 72),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: List.generate(
                      elements.length,
                      (i) => Card(
                            elevation: 5,
                            child: CachedNetworkImage(
                                imageUrl: type == GridType.EQUIPMENT
                                    ? ImageUrlGenerator.getEquipmentUrl(
                                        elements[i].image, "100x100")
                                    : ImageUrlGenerator.getIngredientUrl(
                                        elements[i].image, "100x100")),
                          )),
                ),
              )
            ],
          );
  }
}

enum GridType { EQUIPMENT, INGREDIENT }
