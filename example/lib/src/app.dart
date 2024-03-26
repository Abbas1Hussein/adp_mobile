import 'dart:ffi';

import 'package:adp_mobile/adp_mobile.dart';
import 'package:adp_mobile_preview/adp_mobile_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'controllers/platforms_controller.dart';
import 'controllers/theme_controller.dart';
import 'view/screens/home/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ThemeController controller;

  @override
  void initState() {
    controller = ThemeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode?>(
      valueListenable: controller,
      builder: (context, value, child) {
        return AdpApp(
          themeMode: value,
          debugShowCheckedModeBanner: false,
          // properties: Properties.android(AppAndroidProperty(
          //   darkTheme: ThemeData.dark(useMaterial3: false)
          // )),
          home: HomeScreen2(controller: controller),
        );

        return AdaptiveMobilePreview(
          type: adaptiveValue(
            ios: () => DevicesType.iOS.iPhone12Mini,
            android: () => DevicesType.android.samsungGalaxyNote20,
          ),
          child: AdpApp(
            themeMode: value,
            debugShowCheckedModeBanner: false,
            home: HomeScreen2(controller: controller),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key, required this.controller});

  final ThemeController controller;

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final controller = PlatformController();

  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: _buildAdaptiveAppBarPage(context),
      content: Center(
        child: AdaptiveTextButton(
          onPressed: () {
            showAdpBottomSheet(
              context: context,
              builder: (context) {
                return AdaptiveBottomSheet(
                  title: const Text('User ABBAS HUSSEIN?'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Are you sure you want to delete this user? This action cannot be undone.',
                      ),
                      Image.network('https://i.imgur.com/2KHNJfH.png'),
                    ],
                  ),
                  actions: [
                    AdaptiveBottomSheetAction(
                      child: const Text('Delete'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    AdaptiveBottomSheetAction.skipCancel(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('show bottom sheet'),
        ),
      ),
    );
    return AdaptiveNavigationView(
      appBar: _buildAdaptiveAppBarPage(context),
      navigationBar: AdaptiveNavigationBar(
        currentIndex: _currentValue,
        onChanged: (value) => setState(() => _currentValue = value),
        items: const [
          AdaptiveNavigationBarItem(
            icon: AdaptiveIcon(AdpIcons.home),
            label: 'home',
          ),
          AdaptiveNavigationBarItem(
            icon: AdaptiveIcon(AdpIcons.save),
            label: 'save',
          ),
        ],
      ),
      children: const [
        SizedBox.shrink(),
        SizedBox.shrink(),
      ],
    );
  }

  AdaptiveNavigationAppbar _buildAdaptiveAppBarPage(BuildContext context) {
    return AdaptiveNavigationAppbar(
      title: const Text('AppBar'),
      actions: [
        AdaptivePulldownMenuButton<String>(
          items: [
            AdaptivePulldownMenuItem(
              onTap: widget.controller.lightMode,
              enabled: context.brightness.isDark,
              leading: const AdaptiveIcon.all(Icons.light_mode),
              child: Text(Brightness.light.name),
            ),
            AdaptivePulldownMenuItem(
              onTap: widget.controller.darkMode,
              enabled: context.brightness.isLight,
              leading: const AdaptiveIcon.all(Icons.dark_mode),
              child: Text(Brightness.dark.name),
            ),
          ],
          icon: AdaptiveIcon.all(
            context.brightness.isDark ? Icons.dark_mode : Icons.light_mode,
          ),
        ),
        AdaptivePulldownMenuButton<String>(
          items: [
            AdaptivePulldownMenuItem(
              onTap: _showSystemsDialog,
              child: Text(ThemeMode.system.name),
            ),
            AdaptivePulldownMenuItem(
              enabled: PlatformRuining.targetPlatform ==
                  MobileTargetPlatform.android,
              onTap: () => _showConfirmationDialog(MobileTargetPlatform.iOS),
              child: Text(MobileTargetPlatform.iOS.name),
            ),
            AdaptivePulldownMenuItem(
              enabled:
                  PlatformRuining.targetPlatform == MobileTargetPlatform.iOS,
              onTap: () =>
                  _showConfirmationDialog(MobileTargetPlatform.android),
              child: Text(MobileTargetPlatform.android.name),
            ),
          ],
          icon: const AdaptiveIcon(AdpIcons.deviceMobile),
        ),
      ],
    );
  }

  void _showSystemsDialog() async {
    await _confirmationDialog(
      targetPlatform: defaultTargetPlatform.mobileTargetPlatform,
      onApplied: () async => await controller.clear(),
    );
  }

  void _showConfirmationDialog(MobileTargetPlatform targetPlatform) async {
    await _confirmationDialog(
      targetPlatform: targetPlatform,
      onApplied: () => controller.togglePlatformFrom(targetPlatform),
    );
  }

  Future<void> _confirmationDialog({
    required VoidCallback onApplied,
    required MobileTargetPlatform targetPlatform,
  }) async {
    await DialogPresenter.showConfirmationDialog(
      context,
      title: 'toggle platform to ${targetPlatform.name}',
      message: 'after restart the app this will applied',
      confirmLabel: 'apply',
    ).then(
      (result) {
        if (result == true) onApplied();
      },
    );
  }
}
