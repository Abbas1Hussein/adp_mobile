import 'package:adp_mobile/adp_mobile.dart';
import 'package:example/src/app.dart';

import 'src/controllers/platforms_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final targetPlatform = await PlatformController().targetPlatform;
  DefaultsPlatformManager.initialize(
    targetPlatform: targetPlatform,
    isDebugging: true,
  );

  runApp(const App());
}
