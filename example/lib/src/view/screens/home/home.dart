import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../controllers/platforms_controller.dart';
import '../../../controllers/theme_controller.dart';
import 'tabs/additional/additional.dart';
import 'tabs/buttons/buttons.dart';
import 'tabs/fields/fields.dart';
import 'tabs/icons/icons.dart';
import 'tabs/indicators/indicators.dart';
import 'tabs/layouts/layouts.dart';
import 'tabs/navigation/navigation.dart';
import 'tabs/pickers/pickers.dart';
import 'tabs/surfaces/surfaces.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.controller, super.key});

  final ThemeController controller;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PlatformController controller;

  @override
  void initState() {
    controller = PlatformController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      contentPadding: EdgeInsets.zero,
      appBar: AdaptiveNavigationAppbar(
        title: const Text('Adaptive Desktop'),
        actions: [
          AdaptiveTextButton.icon(
            label: const Text('github'),
            onPressed: () =>
                launchUrlString('https://github.com/Abbas1Hussein/adp_mobile'),
            icon: const AdaptiveIcon(AdpIcons.link),
          ),
          AdaptiveTextButton.icon(
            label: const Text('pub'),
            onPressed: () =>
                launchUrlString('https://pub.dev/packages/adp_mobile'),
            icon: const AdaptiveIcon(AdpIcons.link),
          ),
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
          )
        ],
      ),
      content: ListView(
        children: List.generate(
          children.length,
          (index) => AdaptiveListTile(
            contentPadding: const EdgeInsets.all(16.0),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return AdaptiveScaffoldPage(
                      appBar: AdaptiveAppBarPage(title: Text(labels[index])),
                      content: SingleChildScrollView(child: children[index]),
                    );
                  },
                ),
              );
            },
            title: Text(labels[index]),
            leading: Text('${index + 1}'),
            trailing: AdaptiveIcon.all(icons[index]),
          ),
        ),
      ),
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
    required MobileTargetPlatform targetPlatform,
    required VoidCallback onApplied,
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


  List<IconData> icons = [
    Icons.smart_button,
    Icons.text_fields,
    Icons.insert_emoticon,
    Icons.indeterminate_check_box,
    Icons.layers,
    Icons.navigation,
    Icons.calendar_today,
    Icons.card_giftcard,
    Icons.add_box_rounded,
  ];

  List<String> labels = const [
    'Buttons',
    'Fields',
    'Icons',
    'Indicators',
    'Layouts',
    'Navigation\'s',
    'Pickers',
    'Surfaces',
    'Additional',
  ];

  List<Widget> children = const [
    ButtonsTab(),
    Fields(),
    IconsTab(),
    Indicators(),
    Layouts(),
    NavigationPreview(),
    Pickers(),
    Surfaces(),
    Additional(),
  ];
}
