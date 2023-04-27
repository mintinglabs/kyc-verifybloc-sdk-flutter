import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:verifybloc_flutter/verifybloc_flutter.dart';

import 'test_api.g.dart';

class _ApiLogger
    with MockPlatformInterfaceMixin
    implements TestHostVerifyblocFlutterApi {
  final List<String> log = <String>[];

  @override
  void setAppLocale(String locale) {
    log.add('setAppLocale');
  }

  @override
  void setEnv(int env) {
    log.add('setEnv');
  }

  @override
  void setTheme(VerifyblocTheme theme) {
    log.add('setTheme');
  }

  @override
  void initialize(String partnerId, String appId, String privateKey) {
    log.add('initialize');
  }

  @override
  void startVerification(String userId, int identityType) {
    log.add('startVerification');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('registration', () async {
    VerifyblocFlutter.registerWith();
    expect(VerifyblocFlutterPlatform.instance, isA<VerifyblocFlutter>());
  });

  group('$VerifyblocFlutter', () {
    final VerifyblocFlutter instance = VerifyblocFlutter();
    late _ApiLogger log;

    setUp(() {
      log = _ApiLogger();
      TestHostVerifyblocFlutterApi.setup(log);
    });

    test('initialize', () async {
      await instance.initialize(
        partnerId: 'test_partnerId',
        appId: 'test_app',
        privateKey: 'test_private_key',
      );
      expect(log.log.last, 'initialize');
    });

    test('startVerification', () async {
      await instance.startVerification(userId: '10000');
      expect(log.log.last, 'startVerification');
    });

    test('setEnv', () async {
      await instance.setEnv(VerifyblocEnv.dev);
      expect(log.log.last, 'setEnv');
    });

    test('setAppLocale', () async {
      await instance.setAppLocale('zh-Hans');
      expect(log.log.last, 'setAppLocale');
    });

    test('setTheme', () async {
      await instance.setTheme(VerifyblocTheme(
        style: VerifyblocStyle.dark,
      ));
      expect(log.log.last, 'setTheme');
    });
  });
}
