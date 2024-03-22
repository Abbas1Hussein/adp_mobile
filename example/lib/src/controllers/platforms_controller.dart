import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlatformController {
  Future<MobileTargetPlatform> get targetPlatform async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final platform = sharedPreferences.getString('targetPlatform') ?? defaultTargetPlatform.name;

    return MobileTargetPlatform.values.firstWhere(
      (element) => element.name.contains(platform),
      orElse: () => MobileTargetPlatform.android,
    );
  }

  Future<void> toggleToiOS() async => togglePlatformFrom(MobileTargetPlatform.iOS);

  Future<void> toggleToAndroid() async => togglePlatformFrom(MobileTargetPlatform.android);

  Future<void> togglePlatformFrom(MobileTargetPlatform targetPlatform) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('targetPlatform', targetPlatform.name);
  }

  Future<void> clear() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('targetPlatform');
  }
}
