import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile_preview/adp_mobile_preview.dart';
import 'package:flutter/material.dart';

const themeMode = ThemeMode.dark;

void main() async {
  DefaultsPlatformManager.initialize(
    targetPlatform: MobileTargetPlatform.android,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveMobilePreview(
      type: PlatformRuining.targetPlatform == MobileTargetPlatform.android
          ? DevicesType.android.samsungGalaxyNote20Ultra
          : DevicesType.iOS.iPhone13ProMax,
      child: const AdpApp(themeMode: themeMode, home: HomeScreen()),
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
      appBar: const AdaptiveAppBar(title: Text('title')),
      properties: Properties.android(
        const NavigationViewAndroidProperty(
          mode: AndroidNavigationMode.auto,
        ),
      ),
      navigationBar: AdaptiveNavigationBar(
        currentIndex: currentIndex,
        onChanged: (value) {
          setState(() => currentIndex = value);
        },
        items: [
          AdaptiveNavigationBarItem(
            tooltip: 'home',
            icon: const AdaptiveIcon(AdpIcons.home),
            label: 'home',
          ),
          AdaptiveNavigationBarItem(
            tooltip: 'saved',
            icon: const AdaptiveIcon(AdpIcons.save),
            label: 'saved',
          ),
        ],
      ),
      children: [
        const Center(child: Text('1')),
        Center(
          child: AdaptiveButton(
            child: const Text('GO'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget),
              );
            },
          ),
        ),
      ],
    );
  }
}
