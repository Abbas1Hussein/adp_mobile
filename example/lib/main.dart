import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile_preview/adp_mobile_preview.dart';
import 'package:flutter/material.dart';

const themeMode = ThemeMode.dark;

void main() async {
  DefaultsPlatformManager.initialize(
    targetPlatform: MobileTargetPlatform.iOS,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveMobilePreview(
      type: PlatformRuining.targetPlatform == MobileTargetPlatform.android
          ? DevicesType.android.samsungGalaxyA50
          : DevicesType.iOS.iPhone13Mini,
      child: AdpApp(
        themeMode: themeMode,
        home: adaptiveValue(
          ios: () => const HomeScreen(),
          android: () => const HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationView(
      appBar: const AdaptiveAppBar(
        title: Text('title'),
        leading: AdaptiveIcon(AdpIcons.battery75),
      ),
      navigationBar: AdaptiveNavigationBar(
        currentIndex: currentIndex,
        onChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          AdaptiveNavigationBarItem(
            icon: const AdaptiveIcon(AdpIcons.home),
            label: 'home',
          ),
          AdaptiveNavigationBarItem(
            icon: const AdaptiveIcon(AdpIcons.save),
            label: 'saved',
          ),
        ],
      ),
      children: const [
        Center(child: Text('1')),
        Center(child: Text('2')),
      ],
    );
  }
}
