import 'package:adp_mobile/adp_mobile.dart';

class NavigationViewPreview extends StatefulWidget {
  const NavigationViewPreview({Key? key}) : super(key: key);

  @override
  State<NavigationViewPreview> createState() => _NavigationViewPreviewState();
}

class _NavigationViewPreviewState extends State<NavigationViewPreview> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationView(
      appBar: AdaptiveNavigationAppbar(
        title: const Text('Abbas Hussein'),
        actions: [
          AdaptiveTextButton.icon(
            onPressed: () {},
            label: const Text('Add'),
            icon: const AdaptiveIcon(AdpIcons.add),
          ),
          AdaptiveTextButton.icon(
            onPressed: () {},
            label: const Text('Delete'),
            icon: const AdaptiveIcon(AdpIcons.delete),
          ),
          AdaptiveTextButton.icon(
            onPressed: () {},
            label: const Text('Edit'),
            icon: const AdaptiveIcon(AdpIcons.edit),
          ),
          AdaptiveTextButton.icon(
            onPressed: () {},
            label: const Text('Download'),
            icon: const AdaptiveIcon(AdpIcons.download),
          ),
        ],
      ),
      navigationBar: AdaptiveNavigationBar(
        currentIndex: currentIndex,
        onChanged: (value) {
          setState(() => currentIndex = value);
        },
        items: items,
      ),
      children: List.generate(
        items.length,
        (index) => Center(
          child: AdaptiveButton(
            child: Text(items[index].label!),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  final List<AdaptiveNavigationBarItem> items = const [
     AdaptiveNavigationBarItem(
      label: 'Main Home',
      icon: AdaptiveIcon(AdpIcons.home),
    ),
    AdaptiveNavigationBarItem(
      label: 'Series',
      icon: AdaptiveIcon(AdpIcons.bookFilled),
    ),
    AdaptiveNavigationBarItem(
      label: 'Movies',
      icon: AdaptiveIcon(AdpIcons.book),
    ),
    AdaptiveNavigationBarItem(
      label: 'Watched',
      icon: AdaptiveIcon(AdpIcons.circle),
    ),
    AdaptiveNavigationBarItem(
      label: 'Favorite',
      icon: AdaptiveIcon(AdpIcons.moon),
    ),
    AdaptiveNavigationBarItem(
      label: 'Settings',
      icon: AdaptiveIcon(AdpIcons.settings),
    ),
  ];
}
