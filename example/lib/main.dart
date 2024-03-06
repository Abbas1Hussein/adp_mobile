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
      drawer: AdaptiveDrawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              AdaptiveListTile(
                enabled: true,
                tileColor: AdpColors.cyan,
                leading: const AdaptiveIcon(AdpIcons.battery0),
                title: const Text('battery0'),
                subtitle: const Text('0'),
                onTap: () {},
              ),
              AdaptiveListTile(
                leading: const AdaptiveIcon(AdpIcons.battery25),
                title: const Text('battery25'),
                subtitle: const Text('25'),
                onTap: () {},
              ),
              AdaptiveListTile(
                leading: const AdaptiveIcon(AdpIcons.battery75),
                title: const Text('battery75'),
                subtitle: const Text('75'),
                onTap: () {},
              ),
              AdaptiveListTile(
                leading: const AdaptiveIcon(AdpIcons.battery100),
                title: const Text('battery100'),
                subtitle: const Text('100'),
                onTap: () {},
              ),
              AdaptiveListTile(
                leading: const AdaptiveIcon(AdpIcons.batteryCharge),
                title: const Text('batteryCharge'),
                subtitle: const Text('charging'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
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

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: const AdaptiveAppBarPage(),
      content: Center(
        child: AdaptiveTextButton(
          child: const Text('Switch'),
          onPressed: () {},
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationView(
      appBar: const AdaptiveNavigationAppbar(title: Text('Abbas Hussein')),
      navigationBar: AdaptiveNavigationBar(
        onChanged: (value) {
          setState(() => currentIndex = value);
        },
        currentIndex: currentIndex,
        items: [
          AdaptiveNavigationBarItem(
            icon: const AdaptiveIcon(AdpIcons.app),
            label: 'app',
          ),
          AdaptiveNavigationBarItem(
            icon: const AdaptiveIcon(AdpIcons.home),
            label: 'home',
          ),
        ],
      ),
      children: const [Center(child: Text('1')), Center(child: Text('2'))],
    );
  }
}
