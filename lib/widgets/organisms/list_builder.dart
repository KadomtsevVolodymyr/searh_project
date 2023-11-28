import 'package:flutter/material.dart';
import 'package:search_project/core/theme/theme_palette/default_palette.dart';
import 'package:search_project/generated/assets/assets.gen.dart';

class ListBuilder extends StatelessWidget {
  const ListBuilder({
    super.key,
    required this.isFavorite,
    required this.onPressed,
    required this.name,
  });
  final bool isFavorite;
  final VoidCallback onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: DefaultPalette.layer1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: DefaultPalette.textPrimary,
                    ),
              ),
              GestureDetector(
                onTap: onPressed,
                child: Assets.images.icons.favoriteIcon.svg(
                  color: isFavorite
                      ? DefaultPalette.accentPrimary
                      : DefaultPalette.textPlaceholder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
