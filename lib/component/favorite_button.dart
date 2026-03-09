import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final void Function() onClick;

  const FavoriteButton({super.key, required this.isFavorite, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClick,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        color: isFavorite ? Theme.of(context).colorScheme.primary : null,
      ),
    );
  }

}