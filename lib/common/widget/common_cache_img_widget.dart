import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonCacheImgWidget extends StatelessWidget {

  final String _imgUrl;
  final double _width;
  final double _height;

  CommonCacheImgWidget(this._imgUrl,this._width, this._height);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _imgUrl ?? "",
      width: _width,
      height: _height,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) {
        return Icon(Icons.error);
      },
    );
  }
}
