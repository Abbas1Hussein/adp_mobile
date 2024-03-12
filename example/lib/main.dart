import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile_preview/adp_mobile_preview.dart';

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
  int randomNumber = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: const AdaptiveAppBarPage(title: Text('title')),
      content: Center(
        child: AdaptivePopupMenuButton<String>(
          value: foodItems[randomNumber],
          placeholder: const Text('placeholder'),
          disabledPlaceholder: const Text('disabledPlaceholder'),
          // onChanged: (value) {
          //   print(value);
          //   setState(() => randomNumber = foodItems.indexOf(value!));
          // },
          items: foodItems.map((food) {
            return AdaptivePopupMenuItem<String>(child: Text(food), value: food);
          }).toList(),
        ),
      ),
    );
  }

  final List<String> foodItems = [
    'Pizza',
    'Burger',
    'Salad',
    'Sushi',
    'Tacos',
    'Pasta',
    'Chicken Curry',
    'Ice Cream',
    'Steak',
    'Fried Rice',
    'Pancakes',
    'Shrimp Scampi',
    'Lobster',
    'Caesar Salad',
    'Chocolate Cake',
    'Grilled Cheese Sandwich',
    'Hot Dog',
  ];
}
