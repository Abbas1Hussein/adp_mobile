import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const themeMode = ThemeMode.light;

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
    return AdpApp(
      themeMode: themeMode,
      home: adaptiveValue(
        ios: () => HomeScreen(),
        android: () => HomeScreen(),
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
    return AdaptiveTabView(
      currentIndex: currentIndex,
      onChanged: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      tabs: const [
        AdaptiveTab(label: Text('1'), icon: AdaptiveIcon(AdpIcons.info)),
        AdaptiveTab(label: Text('2'), icon: AdaptiveIcon(AdpIcons.app)),
        AdaptiveTab(label: Text('3'), icon: AdaptiveIcon(AdpIcons.battery75)),
      ],
      children: const [
        Center(child: AdaptiveTimePicker()),
        Center(child: AdaptiveDatePicker()),
        Center(child: Text('3')),
      ],
    );
  }
}
