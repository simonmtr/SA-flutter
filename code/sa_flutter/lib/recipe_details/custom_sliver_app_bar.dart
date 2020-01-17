import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String _imageUrl;
  final Widget _titleText;

  CustomSliverAppBar(this._imageUrl, this._titleText);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      child: SliverSafeArea(
        top: true,
        sliver: SliverAppBar(
          expandedHeight: 280,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: _titleText,
            background: FittedBox(
              fit: BoxFit.fitHeight,
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    Icon(Icons.image, color: Colors.grey, size: 90),
                imageUrl: _imageUrl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
