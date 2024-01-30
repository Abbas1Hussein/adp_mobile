import '../adaptive.dart';

export 'property.dart';

/// Core properties class providing a common structure for platform-specific properties.
abstract class CoreProperties<A, I> {
  CoreProperties({this.android, this.ios});

  /// Android-specific properties.
  A? android;

  /// IOS-specific properties.
  I? ios;
}

/// The [Properties] class allows you to customize the visual and functional aspects
/// of a support widget separately for Android and IOS platforms.
final class Properties<A, I> extends CoreProperties<A, I> {
  Properties({super.android, super.ios});

  Properties.android(A android) : super(android: android);

  Properties.ios(I ios) : super(ios: ios);
}

/// Callback type for defining platform-specific properties.
typedef PropertiesCallback<T> = T Function();

/// The [PropertiesLogic] class allows you to tailor the visual and functional aspects
/// of a support widget independently for Android and IOS platforms.
///
/// This becomes useful when specific properties should be applied only to a particular platform.
final class PropertiesLogic<A, I> extends CoreProperties<A, I> {
  /// creating an instance of [PropertiesLogic].
  factory PropertiesLogic({
    PropertiesCallback<A>? android,
    PropertiesCallback<I>? ios,
  }) {
    return PropertiesLogic._internal(android: android, ios: ios);
  }

  /// creating an instance of [PropertiesLogic] with Android-specific properties.
  factory PropertiesLogic.android(PropertiesCallback<A>? android) {
    return PropertiesLogic._internal(android: android);
  }

  /// creating an instance of [PropertiesLogic] with IOS-specific properties.
  factory PropertiesLogic.ios(PropertiesCallback<I>? ios) {
    return PropertiesLogic._internal(ios: ios);
  }

  /// Internal constructor for [PropertiesLogic].
  PropertiesLogic._internal({
    PropertiesCallback<A>? android,
    PropertiesCallback<I>? ios,
  }) {
    adaptiveValue<void>(
      android: () {
        if (android != null) this.android = android();
      },
      ios: () {
        if (ios != null) this.ios = ios();
      },
    );
  }
}

