import 'package:adp_mobile/adp_mobile.dart';

class BasicButtonsPreview extends StatelessWidget {
  const BasicButtonsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AdaptiveButton(
            child: const Text('Base Button'),
            onPressed: () {},
          ),
          AdaptiveButton.filled(
            child: const Text('Filled Button'),
            onPressed: () {},
          ),
          AdaptiveButton.outlined(
            child: const Text('Outlined Button'),
            onPressed: () {},
          ),
          AdaptiveTextButton(
            child: const Text('Text Button'),
            onPressed: () {},
          ),
          AdaptiveIconButton(
            icon: const AdaptiveIcon(AdpIcons.add),
            onPressed: () {},
          ),
        ]
            .map((child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: child))
            .toList(),
      ),
    );
  }
}
