import 'package:flutter/widgets.dart';

/// An abstract base class for defining a model that can be adapted for both Android and IOS platforms.
///
/// - [A]: Type of data when adapted for the Android platform.
/// - [I]: Type of data when adapted for the IOS platform.
abstract class CoreModel<A, I> {
  /// Converts the model to its representation on the Android platform.
  ///
  /// Returns an instance of [A] representing the model on the Android platform.
  A toAndroid(BuildContext context);

  /// Converts the model to its representation on the IOS platform.
  ///
  /// Returns an instance of [I] representing the model on the IOS platform.
  I toIOS(BuildContext context);
}
