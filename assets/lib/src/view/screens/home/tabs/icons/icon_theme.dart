import 'package:adp_mobile/adp_mobile.dart';

import 'icon_button.dart';

class IconThemePreview extends StatelessWidget {
  const IconThemePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: AdpColors.red, size: 25.0),
      child: const IconButtonPreview(),
    );
  }
}
