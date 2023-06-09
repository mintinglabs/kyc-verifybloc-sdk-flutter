// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, unnecessary_import
// ignore_for_file: avoid_relative_lib_imports
import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;
import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:verifybloc_flutter/src/messages.g.dart';

class _TestHostVerifyblocFlutterApiCodec extends StandardMessageCodec {
  const _TestHostVerifyblocFlutterApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is VerifyblocButtonTheme) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is VerifyblocTheme) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return VerifyblocButtonTheme.decode(readValue(buffer)!);
      case 129: 
        return VerifyblocTheme.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class TestHostVerifyblocFlutterApi {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding => TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> codec = _TestHostVerifyblocFlutterApiCodec();

  void initialize(String partnerId, String appId, String privateKey);

  void startVerification(String userId, int identityType);

  void setEnv(int env);

  void setAppLocale(String locale);

  void setTheme(VerifyblocTheme theme);

  static void setup(TestHostVerifyblocFlutterApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.VerifyblocFlutterApi.initialize', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.initialize was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_partnerId = (args[0] as String?);
          assert(arg_partnerId != null,
              'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.initialize was null, expected non-null String.');
          final String? arg_appId = (args[1] as String?);
          assert(arg_appId != null,
              'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.initialize was null, expected non-null String.');
          final String? arg_privateKey = (args[2] as String?);
          assert(arg_privateKey != null,
              'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.initialize was null, expected non-null String.');
          api.initialize(arg_partnerId!, arg_appId!, arg_privateKey!);
          return <Object?>[];
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.VerifyblocFlutterApi.startVerification', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.startVerification was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_userId = (args[0] as String?);
          assert(arg_userId != null,
              'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.startVerification was null, expected non-null String.');
          final int? arg_identityType = (args[1] as int?);
          assert(arg_identityType != null,
              'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.startVerification was null, expected non-null int.');
          api.startVerification(arg_userId!, arg_identityType!);
          return <Object?>[];
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.VerifyblocFlutterApi.setEnv', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.setEnv was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_env = (args[0] as int?);
          assert(arg_env != null,
              'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.setEnv was null, expected non-null int.');
          api.setEnv(arg_env!);
          return <Object?>[];
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.VerifyblocFlutterApi.setAppLocale', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.setAppLocale was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_locale = (args[0] as String?);
          assert(arg_locale != null,
              'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.setAppLocale was null, expected non-null String.');
          api.setAppLocale(arg_locale!);
          return <Object?>[];
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.VerifyblocFlutterApi.setTheme', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.setTheme was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final VerifyblocTheme? arg_theme = (args[0] as VerifyblocTheme?);
          assert(arg_theme != null,
              'Argument for dev.flutter.pigeon.VerifyblocFlutterApi.setTheme was null, expected non-null VerifyblocTheme.');
          api.setTheme(arg_theme!);
          return <Object?>[];
        });
      }
    }
  }
}
