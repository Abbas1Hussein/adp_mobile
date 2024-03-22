import 'package:adp_mobile/adp_mobile.dart';

class ListTitlePreview extends StatelessWidget {
  const ListTitlePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveListTile(
      leading: const AdaptiveIcon(AdpIcons.info),
      trailing: const AdaptiveIcon(AdpIcons.app),
      title: Text(DummyText.generateQuestion),
      subtitle: Text(DummyText.generateAnswer),

      ///  useBackgroundColor: true,
    );
  }
}
