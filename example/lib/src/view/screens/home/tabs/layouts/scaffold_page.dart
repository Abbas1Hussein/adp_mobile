import 'package:adp_mobile/adp_mobile.dart';

class ScaffoldPagePreview extends StatelessWidget {
  const ScaffoldPagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return  AdaptiveScaffoldPage(
      appBar: AdaptiveAppBarPage(
        title: const Text('Appbar Page'),
        actions: [
          AdaptivePulldownMenuButton(
            items: [
              AdaptivePulldownMenuItem(child: const Text('Action 1'), onTap: () {}),
              AdaptivePulldownMenuItem(child: const Text('Action 2'), onTap: () {}),
              AdaptivePulldownMenuItem(child: const Text('Action 3'), onTap: () {}),
            ],
          ),
        ],
      ),
      content: const Center(child: Text("Give us a star")),
    );
  }
}
