import 'package:adp_mobile/adp_mobile.dart';

class BottomSheetPreview extends StatelessWidget {
  const BottomSheetPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      onPressed: () {
        showAdpBottomSheet(
          context: context,
          builder: (context) {
            return AdaptiveBottomSheet(
              title: Text(DummyText.generateQuestion),
              content: Text(DummyText.generateAnswer),
              actions: [
                AdaptiveBottomSheetAction(
                    child: const Text('Action 1'), onPressed: () {}),
                AdaptiveBottomSheetAction(
                    child: const Text('Action 2'), onPressed: () {}),
              ],
            );
          },
        );
      },
      child: const Text('show bottom sheet'),
    );
  }
}
