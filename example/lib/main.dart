import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile_preview/adp_mobile_preview.dart';

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
  bool currentValue = false;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AdaptiveAppBar(title: const Text('title')),
      body: Center(
        child: AdaptiveTextSearchField<String>(
          options: _kOptions.map(
            (searchKey) {
              return AdaptiveSearchItem<String>(searchKey: searchKey);
            },
          ).toList(),
          onSelected: (value) {
            debugPrint('You just selected: ${value.searchKey}');
          },
        ),
      ),
    );
  }

  static final List<String> _kOptions = <String>[
    '0',
    '1',
    '10',
    '100',
    '1000',
    '10000',
    '100000',
    '1000000',
    '10000000',
    '100000000',
    '1000000000',
    '10000000000',
    '100000000000',
    '1000000000000',
  ];
}
