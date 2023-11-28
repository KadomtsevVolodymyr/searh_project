import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_project/core/theme/solution_theme.dart';

enum ButtonType {
  S,
  M,
  L,
}

enum BackgroundType {
  fill,
  empty,
  tertiary,
}

class ButtonItem extends TextButton {
  final String text;
  final BuildContext context;
  @override
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final BackgroundType filledType;
  @override
  final bool enabled;
  @override
  final FocusNode? focusNode;

  final String? leadingImage;

  final bool emergency;
  final Widget? suffixWidget;
  final Color? bgColor;

  static const double iconSize = 16.0;

  ButtonItem(
    this.context, {
    Key? key,
    required this.text,
    this.filledType = BackgroundType.fill,
    this.buttonType = ButtonType.S,
    this.leadingImage,
    this.enabled = true,
    required this.onPressed,
    this.focusNode,
    this.emergency = false,
    this.suffixWidget,
    this.bgColor,
  }) : super(
          key: key,
          focusNode: focusNode,
          onPressed: enabled ? onPressed : null,
          style: _buttonStyle(
            context: context,
            filledType: filledType,
            isEnabled: enabled,
            emergency: emergency,
            forceBackgroundColor: bgColor,
          ),
          child: Padding(
            padding: _buttonPaddings(buttonType),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leadingImage != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset(
                          leadingImage,
                          height: iconSize,
                          width: iconSize,
                        ),
                      )
                    : const SizedBox(),
                Text(
                  text,
                  softWrap: false,
                  /*style: CoreTheme(context).b1_16Bold.apply(
                      color: filledType == BackgroundType.fill
                          ? CoreTheme(context).textOnColor
                          : CoreTheme(context).textBody),*/
                ),
                suffixWidget != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: suffixWidget,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );

  static ButtonStyle _buttonStyle({
    required bool isEnabled,
    required BuildContext context,
    required BackgroundType filledType,
    required bool emergency,
    Color? forceBackgroundColor,
  }) =>
      isEnabled
          ? ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              overlayColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor,
              ),
              foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).cardColor,
              ),
              backgroundColor: _backgroundColor(
                context,
                filledType,
                forceBackgroundColor,
              ),
              shape: _buttonShape(
                  context: context,
                  filledType: filledType,
                  emergency: emergency,
                  forceBgColor: forceBackgroundColor),
            )
          : ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor,
              ),
            );

  static MaterialStateProperty<OutlinedBorder?> _buttonShape({
    required BuildContext context,
    required BackgroundType filledType,
    required bool emergency,
    Color? forceBgColor,
  }) {
    if (filledType == BackgroundType.empty) {
      final radius = SolutionTheme(context).sizeTheme.buttonBorderRadius;
      return MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            color: emergency
                ? Theme.of(context).errorColor
                : forceBgColor ?? Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      );
    }
    final radius = SolutionTheme(context).sizeTheme.buttonBorderRadius;
    return MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  static EdgeInsets _buttonPaddings(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.S:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
      case ButtonType.M:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0);
      case ButtonType.L:
        return const EdgeInsets.symmetric(horizontal: 31.0, vertical: 16.0);
    }
  }

  static MaterialStateProperty<Color> _backgroundColor(
    BuildContext context,
    BackgroundType backgroundType,
    Color? forceBackgroundColor,
  ) {
    if (forceBackgroundColor != null) {
      return MaterialStateProperty.all<Color>(forceBackgroundColor);
    }
    switch (backgroundType) {
      case BackgroundType.empty:
        return MaterialStateProperty.all<Color>(
            Theme.of(context).backgroundColor);
      case BackgroundType.fill:
        return MaterialStateProperty.all<Color>(Theme.of(context).primaryColor);
      case BackgroundType.tertiary:
        return MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.secondary);
    }
  }
}
