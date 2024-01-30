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
    const text =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
    return Center(
      child: AdaptiveWidget(
        onAndroid: (context) {
          print('onAndroid');
          return DatePickerDialog(
              firstDate: DateTime.now(), lastDate: DateTime.now());
        },
        oniOS: (context) {
          print('oniOS');
          return CupertinoDatePicker(onDateTimeChanged: (value) {});
        },
      ),
    );
  }
}
