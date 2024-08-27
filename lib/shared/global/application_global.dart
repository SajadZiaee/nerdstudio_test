class ApplicationGlobal {
  ApplicationGlobal._privateConstructor();

  static final ApplicationGlobal _instance = ApplicationGlobal._privateConstructor();

  factory ApplicationGlobal() {
    return _instance;
  }

  String? _accessToken;

  String? get accessToken => _accessToken;
  set accessToken(String? token) => _accessToken = token;

  static void setAccessToken(String token) {
    ApplicationGlobal().accessToken = token;
  }

  static String? getAccessToken() {
    return ApplicationGlobal().accessToken;
  }
}
