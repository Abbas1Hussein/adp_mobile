import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/material.dart';

class ScaffoldPreview extends StatefulWidget {
  const ScaffoldPreview({super.key});

  @override
  State<ScaffoldPreview> createState() => _ScaffoldPreviewState();
}

class _ScaffoldPreviewState extends State<ScaffoldPreview> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AdaptiveAppBar(
        title: const Text('Abbas Hussein'),
        actions: const [
          AdaptiveIcon(AdpIcons.camera),
          SizedBox(width: 4.0),
          AdaptiveIcon(AdpIcons.ellipsesVert),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: List.generate(
            labels.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: AdaptiveListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: AdaptiveIcon(icons[index]),
                  title: labels[index],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: Scaffold.of(context).openEndDrawer,
          child: const AdaptiveIcon(AdpIcons.add),
        );
      }),
      bottomNavigationBar: AdaptiveBottomNavigationBar(
        currentIndex: _currentValue,
        onChanged: (value) {
          setState(() {
            _currentValue = value;
          });
        },
        items: [
          AdaptiveBottomNavigationBarItem(
            icon: AdaptiveIcon(icons[0]),
            label: 'home',
          ),
          AdaptiveBottomNavigationBarItem(
            icon: AdaptiveIcon(icons[1]),
            label: 'series',
          )
        ],
      ),
      body: const SizedBox.shrink(),
    );
  }

  List<AdpIcons> get icons {
    return const [
      AdpIcons.home,
      AdpIcons.bookFilled,
      AdpIcons.book,
      AdpIcons.circle,
      AdpIcons.moon,
      AdpIcons.settings,
    ];
  }

  List<Widget> get labels {
    return const [
      Text('Main Home'),
      Text('Series'),
      Text('Movies'),
      Text('Watched'),
      Text('Favorite'),
      Text('Settings'),
    ];
  }
}
