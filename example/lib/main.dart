import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    const theme = ThemeMode.dark;
    if (PlatformRuining.targetPlatform == MobileTargetPlatform.android) {
      return MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const TitleBar(child: Scaffold(body: HomeScreen())),
      );
    } else {
      return const CupertinoApp(
        theme: theme == ThemeMode.dark
            ? CupertinoThemeData(
                scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray)
            : CupertinoThemeData(applyThemeToAll: true),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        home: TitleBar(
          child: CupertinoPageScaffold(child: HomeScreen()),
        ),
      );
    }
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _currentValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
    );
  }
}
