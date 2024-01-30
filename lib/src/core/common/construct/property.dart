/// Base class for all specific android properties.
///
/// All specific android properties must extend this class.
///
/// See also:
///
/// * [Properties] Used to create android-specific properties.
/// * [PropertiesLogic] Used to create android-specific properties, applied only to the android platform.
abstract class CoreAndroidProperty {
  const CoreAndroidProperty();
}

/// Base class for all specific ios properties.
///
/// All specific ios properties must extend this class.
///
/// See also:
///
/// * [Properties] Used to create ios-specific properties.
/// * [PropertiesLogic] Used to create ios-specific properties, applied only to the ios platform.
abstract class CoreIOSProperty {
  const CoreIOSProperty();
}
