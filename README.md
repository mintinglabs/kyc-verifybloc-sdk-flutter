# verifybloc_flutter

[![pub package](https://img.shields.io/pub/v/verifybloc_flutter.svg)](https://pub.dev/packages/verifybloc_flutter)
[![pub points](https://img.shields.io/pub/points/verifybloc_flutter)](https://pub.dev/packages/verifybloc_flutter/score)
[![license](https://img.shields.io/github/license/mintinglabs/kyc-verifybloc-sdk-flutter)](https://github.com/mintinglabs/kyc-verifybloc-sdk-flutter/blob/main/LICENSE)

Flutter版VerifyBloc SDK。

## 开始使用

### 设置运行环境（可选）

```dart
import 'package:verifybloc_flutter/verifybloc_flutter.dart';

final VerifyblocFlutter _verifyblocFlutterPlugin = VerifyblocFlutter();
// Switch env, default to [VerifyblocEnv.prd]
_verifyblocFlutterPlugin.setEnv(VerifyblocEnv.uat);
```

### ‼️ 配置App数据（必须）

```dart
// Configure your app data before starting verification
_verifyblocFlutterPlugin.initialize(
  partnerId: 'partnerId',
  appId: 'appId',
  privateKey: 'privateKey',
);
```

### 设置SDK语言（可选）

```dart
// Some examples of such identifiers: "en", "es-419", "hi-Deva-IN" and
// "zh-Hans-CN". See http://www.unicode.org/reports/tr35/ for technical
// details.
_verifyblocFlutterPlugin.setAppLocale('zh-Hans-CN');
```

> **Note**
>
> 在Android上，使用setAppLocale()会改变当前应用的语言。因为这是通过[`LocaleManager API`](https://developer.android.com/guide/topics/resources/app-languages)来实现的。

### 定制SDK界面（可选）

```dart
_verifyblocFlutterPlugin.setTheme(VerifyblocTheme(
  style: VerifyblocStyle.dark,
  mainColor: Colors.amber,
  buttonStyle: VerifyblocButtonTheme(
    color: Colors.amber,
    gradient: _isBtnGradient
      ? (Int32List.fromList(<int>[
          Colors.orange.hex,
          Colors.purple.hex,
        ]))
      : null,
    textColor: Colors.white,
    borderRadius: 8,
  ),
));
```

| Light                                                                                                            | Dark                                                                                                            |
|------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| ![](https://raw.githubusercontent.com/mintinglabs/kyc-verifybloc-sdk-flutter/main/example/screenshots/light.jpg) | ![](https://raw.githubusercontent.com/mintinglabs/kyc-verifybloc-sdk-flutter/main/example/screenshots/dark.jpg) |

### 🚀 最后，发起认证

```dart
_verifyblocFlutterPlugin.startVerification(
  // An identifier associated with the current user in your app.
  userId: 'userId',
  // or 'VerifyblocIdentityType.corporate'
  identityType: VerifyblocIdentityType.personal,
);
```

通过`VerifyblocIdentityType`设定认证类型，目前支持以下2种类型

| Value     | Description |
|-----------|-------------|
| personal  | 个人          |
| corporate | 企业          |

> 如果你想了解更多关于`认证类型`的信息，请查阅[VerifyBloc简介](https://msy4ond8ae.sg.larksuite.com/docx/DKDNdg64toEYbyxbFmUlePvHg7d#PcvZdtPu8oYv5QxOmPulJ8ZFg6c)

## 了解更多

- [API Documentation](https://pub.dev/documentation/verifybloc_flutter/latest/)
- [VerifyBloc Integration Documentation](https://msy4ond8ae.sg.larksuite.com/docx/DKDNdg64toEYbyxbFmUlePvHg7d)
