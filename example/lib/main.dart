import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const themeMode = ThemeMode.light;

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
    return AdpApp(
      themeMode: themeMode,
      home: adaptiveValue(
        ios: () => const CupertinoPageScaffold(child: HomeScreen()),
        android: () => const Scaffold(body: HomeScreen()),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _currentValue = 10;

  @override
  Widget build(BuildContext context) {
    const content =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
    return Center(
      child: AdaptiveTimePicker(
        onSelected: (value) {
          print(value);
        },
        onCancel: () {
          print('onCancel');
        },
        properties: Properties.ios(
          const TimePickerIOSProperty(mode: CupertinoTimerPickerMode.hms),
        ),
      ),
    );
  }
}
