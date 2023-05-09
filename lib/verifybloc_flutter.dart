import 'package:verifybloc_flutter_platform_interface/verifybloc_flutter_platform_interface.dart'
    show VerifyblocEnv, VerifyblocFlutterPlatform, VerifyblocIdentityType;

import 'src/messages.g.dart';

export 'package:verifybloc_flutter_platform_interface/verifybloc_flutter_platform_interface.dart'
    show VerifyblocEnv, VerifyblocFlutterPlatform, VerifyblocIdentityType;
export 'src/messages.g.dart'
    show VerifyblocButtonTheme, VerifyblocStyle, VerifyblocTheme;

class VerifyblocFlutter extends VerifyblocFlutterPlatform {
  factory VerifyblocFlutter() {
    return _singleton ??= VerifyblocFlutter._();
  }

  VerifyblocFlutter._();

  static VerifyblocFlutter? _singleton;

  final VerifyblocFlutterApi _api = VerifyblocFlutterApi();

  /// Registers ths class as the default instance of [VerifyblocFlutterPlatform].
  static void registerWith() {
    VerifyblocFlutterPlatform.instance = VerifyblocFlutter();
  }

  @override
  Future<void> initialize({
    required String partnerId,
    required String appId,
    required String privateKey,
  }) {
    assert(partnerId.isNotEmpty);
    assert(appId.isNotEmpty);
    assert(privateKey.isNotEmpty);

    return _api.initialize(partnerId, appId, privateKey);
  }

  @override
  Future<void> startVerification({
    required String userId,
    VerifyblocIdentityType identityType = VerifyblocIdentityType.personal,
  }) {
    assert(userId.isNotEmpty);

    return _api.startVerification(userId, identityType.index);
  }

  @override
  Future<void> setEnv(VerifyblocEnv env) {
    return _api.setEnv(env.index);
  }

  Future<void> setAppLocale(String locale) {
    return _api.setAppLocale(locale);
  }

  Future<void> setTheme(VerifyblocTheme theme) {
    // TODO(Hito): Avoid cast error when exporting to Swift.
    theme.buttonStyle ??= VerifyblocButtonTheme();
    return _api.setTheme(theme);
  }
}
