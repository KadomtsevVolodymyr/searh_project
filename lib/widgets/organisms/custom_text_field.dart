import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_project/core/theme/theme_palette/default_palette.dart';
import 'package:search_project/widgets/tokens/spacing.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.placeholder,
    required this.startIcon,
    required this.endIcon,
    required this.isEnabled,
    this.onSend,
  });

  final String placeholder;
  final SvgPicture startIcon;
  final SvgPicture endIcon;
  final bool isEnabled;
  final Function(String)? onSend;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  static const paddingAll16 = EdgeInsets.all(Spacing.sixteen);
  final borderRadius = BorderRadius.circular(30.0);
  static const borderWidth = 2.0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: widget.onSend,
      focusNode: _focusNode,
      enabled: widget.isEnabled,
      decoration: InputDecoration(
        filled: true,
        fillColor:
            _isFocused ? DefaultPalette.accentSecondary : DefaultPalette.layer1,
        hintText: widget.placeholder,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: Padding(
          padding: paddingAll16,
          child: widget.startIcon,
        ),
        suffixIcon: _isFocused
            ? Padding(
                padding: paddingAll16,
                child: widget.endIcon,
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: DefaultPalette.accentPrimary,
            width: borderWidth,
          ),
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
