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
            AdaptivePulldownMenuButton<String>.singleChoice(
                highlightColor: Colors.redAccent,
                onSelected: (index, value) {
                  print('index $index');
                  print('value $value');
                },
                items: const [
                  AdaptivePulldownMenuItem(
                    enabled: true,
                    value: 'New folder',
                    leading: AdaptiveIcon(AdpIcons.folderAdd),
                    child: Text('New folder'),
                  ),
                  AdaptivePulldownMenuItem(
                    leading: AdaptiveIcon(AdpIcons.folderOpen),
                    child: Text('Open'),
                  ),
                  AdaptivePulldownMenuItem(
                    leading: AdaptiveIcon(AdpIcons.wand),
                    child: Text('Open with'),
                  ),
                  AdaptivePulldownMenuItem(
                    leading: AdaptiveIcon(AdpIcons.delete),
                    child: Text('Remove'),
                    enabled: false, // this will disabled.
                  ),
                  AdaptivePulldownMenuItem(
                    leading: AdaptiveIcon(AdpIcons.phone),
                    child: Text('Import from phone ...'),
                  ),
                  AdaptivePulldownMenuDivider(),
                  AdaptivePulldownMenuItem(
                    leading: AdaptiveIcon(AdpIcons.star),
                    child: Text('Give us a star'),
                  ),
                ]),
            const AdaptiveCloseButton(),
            const AdaptiveBackButton(),
          ],
        ),
      ),
    );
  }
}
