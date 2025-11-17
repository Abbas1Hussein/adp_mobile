import 'package:adp_mobile/adp_mobile.dart';

class NavigationButtonsPreview extends StatelessWidget {
  const NavigationButtonsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AdaptiveBackButton().margeWith(const Text('Back')),
        const AdaptiveCloseButton().margeWith(const Text('Close')),
      ],
    );
  }
}
