import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/material.dart' show MaterialLocalizations;

import 'highlight_code.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    this.path,
    this.message,
    this.useBackgroundColor = false,
    required this.title,
  });

  final String? path;
  final String title;
  final String? message;

  final bool useBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: AdaptiveListTile(
        onTap: () {
          if (message != null && path != null) {
            DialogPresenter.showConfirmationDialog(
              context,
              title: title,
              message: message!,
              confirmLabel: 'Source code',
              cancelLabel: 'Cancel',
            ).then(
              (value) {
                if (value == true) {
                  _buildHighlightViewCode(context);
                }
              },
            );
          } else if (message != null && path == null) {
            DialogPresenter.showInformationDialog(
              context,
              title: title,
              message: message!,
              confirmLabel: localizations.cancelButtonLabel,
            );
          }
        },
        title: Text(title),
        subtitle: message != null ? Text(message!) : null,
      ),
    );
  }

  void _buildHighlightViewCode(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        //   transition: AdaptiveTransition.entrance,
        pageBuilder: (context, animation, secondaryAnimation) {
          return HighlightViewCode(title: title, path: path ?? '');
        },
      ),
    );
  }
}
