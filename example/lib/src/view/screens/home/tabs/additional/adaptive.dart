import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveValuePreview extends StatelessWidget {
  const AdaptiveValuePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AdaptiveButton.filled(
        child: Text(PlatformRuining.isIOS ? 'show cupertino Alert-Dialog' : 'show material License-Page'),
        onPressed: () => adaptiveValue(
          // handel some think on macOS.
          ios: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title:  Text(DummyText.generateQuestion),
                  content:  Text(DummyText.generateAnswer),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('cancel'),
                    ),
                  ],
                );
              },
            );
          },
          // handel some think on Windows.
          android: () => showLicensePage(context: context),
        ),
      ),
    );
  }
}
