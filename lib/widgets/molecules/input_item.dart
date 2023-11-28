import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_project/core/theme/solution_theme.dart';

class SvgHideModel {
  final String svgPathShow;
  final String svgPathHide;

  SvgHideModel({
    required this.svgPathShow,
    required this.svgPathHide,
  });
}

class InputItem extends StatefulWidget {
  final String hintText;
  final String? Function(String?, BuildContext context)? validateFunction;
  final void Function(String)? onChanged;
  final String? value;
  final String? errorText;
  final int maxLines;
  final List<TextInputFormatter>? textInputFormatters;
  final FocusNode? focusNode;
  final bool showErrorText;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final bool autofocus;
  final List<String>? autofillHints;
  final IconButton? suffixIconButton;
  final String? assistText;
  final bool obscureText;
  final Key? errorKey;

  //hide field functionallity
  final SvgHideModel? hideSvgModel;

  final AutovalidateMode? autovalidateMode;

  final TextStyle? style;

  const InputItem({
    this.hintText = '',
    this.validateFunction,
    this.onChanged,
    this.value,
    super.key,
    this.errorText,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.textInputFormatters,
    this.focusNode,
    this.showErrorText = true,
    this.obscureText = false,
    this.onEditingComplete,
    this.autofocus = false,
    this.autofillHints,
    this.autovalidateMode,
    this.suffixIconButton,
    this.assistText,
    this.style,
    this.errorKey,
    this.hideSvgModel,
  });

  @override
  State<StatefulWidget> createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  final TextEditingController _controller = TextEditingController();
  bool obscureText = false;

  @override
  void initState() {
    super.initState();

    obscureText = widget.obscureText;

    if (widget.value != null) {
      _controller.text = widget.value!;
    }
  }

  @override
  void didUpdateWidget(covariant InputItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    obscureText = widget.obscureText;
  }

  void _toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onFieldSubmitted: widget.onFieldSubmitted,
          autofocus: widget.autofocus,
          focusNode: widget.focusNode,
          autovalidateMode: widget.autovalidateMode,
          inputFormatters: widget.textInputFormatters ?? [],
          controller: _controller,
          validator: (value) {
            if (widget.validateFunction != null) {
              return widget.validateFunction!(value, context);
            }
            return null;
          },
          style: widget.style,
          minLines: 1,
          textInputAction: TextInputAction.next,
          onEditingComplete: widget.onEditingComplete,
          autofillHints: widget.autofillHints,
          obscureText: obscureText,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
            setState(() {});
          },
          decoration: _decoration(context),
        ),
        const SizedBox(
          height: 4.0,
        ),
        SizedBox(
          child: widget.assistText != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.assistText!,
                    key: widget.errorKey,
                  ),
                )
              : null,
        ),
      ],
    );
  }

  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      errorMaxLines: 5,
      errorText: widget.errorText,
      helperText: widget.showErrorText ? null : '',
      hintMaxLines: 1,
      hintText: widget.hintText,
      suffixIcon: _suffixIconWidget(),
    );
  }

  Widget? _suffixIconWidget() {
    return widget.hideSvgModel != null
        ? _selectHideIcon()
        : widget.suffixIconButton;
  }

  Widget _selectHideIcon() {
    final sizeIcon = SolutionTheme(context).sizeTheme.iconSize;
    return GestureDetector(
      onTap: () {
        _toggleObscure();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: obscureText
            ? SvgPicture.asset(
                widget.hideSvgModel!.svgPathShow,
                width: sizeIcon,
                height: sizeIcon,
              )
            : SvgPicture.asset(
                widget.hideSvgModel!.svgPathHide,
                width: sizeIcon,
                height: sizeIcon,
              ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
