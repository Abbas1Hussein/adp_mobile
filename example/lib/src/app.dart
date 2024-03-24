import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile_preview/adp_mobile_preview.dart';

import 'controllers/theme_controller.dart';
import 'view/screens/home/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ThemeController controller;

  @override
  void initState() {
    controller = ThemeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode?>(
      valueListenable: controller,
      builder: (context, value, child) {
        return AdaptiveMobilePreview(
          type: adaptiveValue(
            ios: () => DevicesType.iOS.iPhone12ProMax,
            android: () => DevicesType.android.samsungGalaxyNote20,
          ),
          child: AdpApp(
            themeMode: value,
            debugShowCheckedModeBanner: false,
            home: HomeScreen(controller: controller),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key, required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: AdaptiveAppBarPage(
        title: const Text('AppBar'),
        actions: [
          AdaptiveTextButton(
            onPressed: () {},
            child: const Text('Action 1'),
          ),
          AdaptiveTextButton(
            onPressed: () {},
            child: const Text('Action 2'),
          ),
          AdaptiveIconButton(
            onPressed: () {},
            icon: const AdaptiveIcon(AdpIcons.camera),
          ),
          AdaptivePulldownMenuButton(
            items: List.generate(
              10,
              (index) => AdaptivePulldownMenuItem(
                child: Text('${index + 1}'),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
