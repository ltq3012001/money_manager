class StyleManager {
  static final StyleManager _singleton = StyleManager._internal();

  factory StyleManager() {
    return _singleton;
  }

  StyleManager._internal();
}
