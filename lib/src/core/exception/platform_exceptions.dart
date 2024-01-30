class UnsupportedPlatformException implements Exception {
  const UnsupportedPlatformException(this.platformName);

  final String platformName;

  @override
  String toString() {
    return 'Unsupported platform: $platformName.\n"adp_mobile package" is not supported on this platform.';
  }
}
