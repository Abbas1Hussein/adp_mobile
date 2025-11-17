import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/material.dart';

class TabViewPreview extends StatelessWidget {
  const TabViewPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: AdaptiveTabView(
        tabBar: AdaptiveTabBar(margin: const EdgeInsets.all(8.0), tabs: tabs),
        children: List.generate(
          tabs.length,
          (index) => Center(
            child: AdaptiveButton(
              child: tabs[index].label,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
    );
  }

  final List<AdaptiveTab> tabs = const [
    AdaptiveTab(
      label: Text('Movies'),
      icon: AdaptiveIcon.all(Icons.movie),
    ),
    AdaptiveTab(
      label: Text('Favorite'),
      icon: AdaptiveIcon.all(Icons.favorite),
    ),
    AdaptiveTab(
      label: Text('Settings'),
      icon: AdaptiveIcon(AdpIcons.settings),
    ),
  ];
}
