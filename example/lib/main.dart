import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile_preview/adp_mobile_preview.dart';
import 'package:flutter/material.dart';

const themeMode = ThemeMode.light;

void main() async {
  DefaultsPlatformManager.initialize(targetPlatform: MobileTargetPlatform.iOS);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveMobilePreview(
      type: PlatformRuining.targetPlatform == MobileTargetPlatform.android
          ? DevicesType.android.onePlus8Pro
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
    return AdaptiveScaffold(
      appBar: AdaptiveAppBar(title: const Text('AppBar')),
      bottomNavigationBar: AdaptiveBottomNavigationBar(
        currentIndex: currentIndex,
        onChanged: (value) {
          setState(() => currentIndex = value);
        },
        items: [
          AdaptiveBottomNavigationBarItem(
            icon: const AdaptiveIcon(AdpIcons.app),
            label: 'app',
          ),
          AdaptiveBottomNavigationBarItem(
            icon: const AdaptiveIcon(AdpIcons.home),
            label: 'home',
          ),
        ],
      ),
      body: Center(
        child: AdaptiveButton.filled(
          child: const Text('Home Screen'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstScreen()),
            );
          },
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: const AdaptiveAppBarPage(),
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AdaptivePopupMenuButton<int>(
              value: currentIndex,
              isExpanded: true,
              onChanged: (value) => setState(() => currentIndex = value!),
              items: const [
                AdaptivePopupMenuItem(value: 0, child: Text('Blue')),
                AdaptivePopupMenuItem(value: 1, child: Text('Green')),
                AdaptivePopupMenuItem(value: 2, child: Text('Red')),
                AdaptivePopupMenuItem(value: 3, child: Text('Yellow')),
                AdaptivePopupMenuItem(value: 4, child: Text('Purple')),
                AdaptivePopupMenuItem(value: 5, child: Text('Orange')),
              ],
            ),
            const AdaptiveCloseButton(),
            const AdaptiveBackButton(),
          ],
        ),
      ),
    );
  }
}
// AdaptivePulldownMenuButton<int>(
//   highlightColor: CupertinoColors.systemBlue,
//   items: List.generate(10, (index) {
//     return AdaptivePulldownMenuItem(
//       child: Text('${index + 1}'),
//       leading: const AdaptiveIcon(AdpIcons.checkMark, size: 18.0, color: Colors.black),
//     );
//   }),
// ),
