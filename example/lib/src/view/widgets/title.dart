import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/material.dart' show MaterialLocalizations;

import 'highlight_code.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    this.path,
    required this.message,
    required this.title,
  });

  final String? path;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: AdaptiveListTile(
        onTap: () {
          DialogPresenter.showCustomDialog(
            context,
            child: AdaptiveDialog(
              title: Text(title),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: message.split('\n').map(
                  (line) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(line),
                    );
                  },
                ).toList(),
              ),
              actions: [
                AdaptiveDialogAction(
                  child: const Text("Source Code"),
                  onPressed: () {
                    _buildHighlightViewCode(context);
                  },
                ),
                AdaptiveDialogAction(
                  child: Text(localizations.cancelButtonLabel),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
        title: Text(title),
        //subtitle: message != null ? Text(message!) : null,
      ),
    );
  }

  void _buildHighlightViewCode(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        //transition: AdaptiveTransition.entrance,
        pageBuilder: (context, animation, secondaryAnimation) {
          return HighlightViewCode(title: title, path: path ?? '');
        },
      ),
    );
  }
}
