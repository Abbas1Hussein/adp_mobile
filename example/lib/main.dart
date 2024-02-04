import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const theme = ThemeMode.dark;

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
    final isMobile = !PlatformRuining.isWeb &&
        (PlatformRuining.isRealAndroid || PlatformRuining.isRealIOS);
    if (PlatformRuining.targetPlatform == MobileTargetPlatform.android) {
      final titleBar = !isMobile
          ? const TitleBar(child: Scaffold(body: HomeScreen()))
          : const Scaffold(body: HomeScreen());
      return MaterialApp(
        themeMode: theme,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: titleBar,
      );
    } else {
      final titleBar = !isMobile
          ? const TitleBar(child: CupertinoPageScaffold(child: HomeScreen()))
          : const CupertinoPageScaffold(child: HomeScreen());

      return CupertinoApp(
        theme: theme == ThemeMode.dark
            ? const CupertinoThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
              )
            : const CupertinoThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: CupertinoColors.white,
              ),
        localizationsDelegates: const [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        home: titleBar,
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
  double _currentValue = 10;

  @override
  Widget build(BuildContext context) {
    const content =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
    return Center(
      child: AdaptiveButton(
        onPressed: () {},
        child: Text('text button'),
      ),
    );
  }
}
