import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:search_project/widgets/molecules/button_item.dart';

const Key dialogKey = Key('modalDialogRootKey');
const Key iconKey = Key('modalDialogIconKey');
const Key headerKey = Key('modalDialogHeaderKey');
const Key descriptionKey = Key('modalDialogDescriptionKey');
const Key primaryButtonKey = Key('modalDialogPrimaryButtonKey');
const Key secondaryButtonKey = Key('modalDialogSecondaryButtonKey');

enum IconType { success, doubt, error, warning, rocket }

const icons = <IconType, String>{
  IconType.success: 'assets/icons/ic_success.svg',
  IconType.doubt: 'assets/icons/ic_doubt.svg',
  IconType.error: 'assets/icons/ic_error.svg',
  IconType.warning: 'assets/icons/ic_warning.svg',
  IconType.rocket: 'assets/icons/ic_rocket_small.svg',
};

class ModalButtonDetails {
  final String title;
  final VoidCallback callback;

  ModalButtonDetails({
    required this.title,
    required this.callback,
  });
}

class DialogModal extends StatelessWidget {
  const DialogModal({
    required this.iconType,
    required this.header,
    this.description,
    required this.primaryButton,
    this.secondaryButton,
    super.key,
  });

  final IconType iconType;
  final String header;
  final String? description;
  final ModalButtonDetails primaryButton;
  final ModalButtonDetails? secondaryButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: dialogKey,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon
              SvgPicture.asset(
                icons[iconType]!,
                key: iconKey,
                height: 32,
                width: 32,
              ),

              const SizedBox(height: 12),

              // Header
              Text(
                header,
                key: headerKey,
                textAlign: TextAlign.center,
              ),

              // Description
              if (description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    description!,
                    key: descriptionKey,
                    // style: CoreTheme(context).b2_14Regular.copyWith(color: CoreTheme(context).textTitle),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 12),

              // Primary Button
              ButtonItem(
                context,
                key: primaryButtonKey,
                buttonType: ButtonType.L,
                text: primaryButton.title,
                onPressed: primaryButton.callback,
              ),

              // Secondary Button
              if (secondaryButton != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ButtonItem(
                    context,
                    key: secondaryButtonKey,
                    buttonType: ButtonType.L,
                    filledType: BackgroundType.empty,
                    text: secondaryButton!.title,
                    onPressed: secondaryButton!.callback,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
