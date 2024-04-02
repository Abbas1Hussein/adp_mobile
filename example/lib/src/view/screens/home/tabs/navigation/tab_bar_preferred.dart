import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/material.dart';

class TabBarPreferredPreview extends StatelessWidget {
  const TabBarPreferredPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: StatefulBuilder(
        builder: (context, setState) {
          return AdaptiveScaffold(
            appBar: AdaptiveAppBar(
              title: const Text('Abbas Hussein'),
              bottom: AdaptiveTabBarPreferred(
                tabs: tabs,
                onChanged: (value) => setState(() {}),
              ),
              actions: const [
                AdaptiveIcon(AdpIcons.camera),
                SizedBox(width: 6.0),
                AdaptiveIcon(AdpIcons.ellipsesVert),
              ],
            ),
            body: Center(child: tabs[DefaultTabController.of(context).index]),
          );
        },
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
