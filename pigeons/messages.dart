import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartTestOut: 'test/test_api.g.dart',
  swiftOut: 'ios/Classes/Messages.swift',
  kotlinOut:
      'android/src/main/kotlin/com/mintinglabs/verifybloc_flutter/Messages.kt',
  kotlinOptions: KotlinOptions(
    package: 'com.mintinglabs.verifybloc_flutter',
  ),
))
enum VerifyblocStyle {
  light,
  dark,
}

class VerifyblocTheme {
  const VerifyblocTheme({
    this.style = VerifyblocStyle.light,
    this.mainColor,
    this.buttonStyle,
  });

  final VerifyblocStyle style;
  final int? mainColor;
  final VerifyblocButtonTheme? buttonStyle;
}

class VerifyblocButtonTheme {
  const VerifyblocButtonTheme({
    this.color,
    this.gradient,
    this.textColor,
    this.borderRadius,
  });

  final int? color;
  final Int32List? gradient;
  final int? textColor;
  final double? borderRadius;
}

@HostApi(dartHostTestHandler: 'TestHostVerifyblocFlutterApi')
abstract class VerifyblocFlutterApi {
  void initialize(
    String partnerId,
    String appId,
    String privateKey,
  );
  // 开始验证
  void startVerification(String userId, int identityType);
  void setEnv(int env);
  void setAppLocale(String locale);
  void setTheme(VerifyblocTheme theme);
}
