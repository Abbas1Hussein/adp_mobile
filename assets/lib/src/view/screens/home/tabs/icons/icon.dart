import 'package:adp_mobile/adp_mobile.dart';

class IconPreview extends StatelessWidget {
  const IconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveIcon(AdpIcons.add),
        AdaptiveIcon(AdpIcons.edit),
        AdaptiveIcon(AdpIcons.delete),
      ],
    );
  }
}
