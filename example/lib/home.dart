import 'dart:typed_data';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verifybloc_flutter/verifybloc_flutter.dart';

import 'widget/color_field.dart';
import 'widget/field_prefix_text.dart';
import 'widget/small_title.dart';

final String _kLocale = const Locale.fromSubtags(
  languageCode: 'zh',
  scriptCode: 'Hans',
).toLanguageTag();
// const String _kPartnerId = 'PAT23031381202386007265';
// const String _kAppId = 'AP23031381299549002932';
// const String _kPrivateKey = '''
// MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC+KvPeru4GmxA4
// WXaLmlnWCQFgrr6abJ7hRwtGDPvoEqaF5SnUlseryekglsJKGWV7zmT0Njte42EK
// 5h0f01cKw02E1t/Tkgudf86VGHyP7+s4mE81f1xEMLgEGRlFiKklYOjxtleMJHxJ
// S4/EYHGWtCivDoUMdofgyCL9cX4R5Hwna61JLUBNxTcBJt11qhG5hEV+8UN4YuRV
// B8jjUWaJqnWJAhmLE4+q8aJBJ8V71pjdnp+YOxSX+zKZS22mqXDUCS6SpOg8eDAu
// jnFPbi5vxUdS65bmhupTMuCmV2a5j/YK2Da5cM0rDK9ROmlyOoWGHQPHbfAPm5fM
// Y6hP3hffAgMBAAECggEAD/2+qiAdpfKOJ57mSBD/su7o7b9kCcpOhfUabpaS7E39
// MM83eEgBnGGLOBFVXzPJg+K0PJD+5xjJxUfadR2peR85Oo1zHvBuB52CuqjneJcd
// OZIdPwtpr9ZE8xtFM8KtLpZ6oDDMJd2/kc5H1aSiiKC3txjKeWTSQkWyI4vSpSBj
// RCu0u5MnA6d4RUxbe1I4mZC86aJygquHs3CMRIMYPo3k9dn1YmW7UghCGkNLjvJZ
// X3e6MTIrWRxFbnnrgaIRpEaPDV0Rk63rXHfQP/qlS/MJSOOAsMXTYICuk+PVc4wC
// 2Qq98aUayOtPNl1wF/N9x1JYYnG9LegQhAxY0/v6iQKBgQDzDIWHbgZO3o4ibQok
// Njpah0O98mti5m3iMXT3FspKPdy3RVhHa9Juk/aLAZT6NQEGL8BdRAGDfrBdoBk/
// EkOLUdQReMKrcTMJH3BSETb3fq/yZMCVtKgSpd8eqKq9q2VXQLzeyXOhERrWP+9K
// o0raZ4/B+PtGByBC9KXheZzCDQKBgQDITRGtq5cNXITMiptRKZ4UNEfA/lCiyGXH
// JUfb1HRO/f09gniR9F+Rm9rMzqD4atbb2bb53djTyqpz2lXP1lV8ar1YAa0lHWvw
// RgQ28YcB3YLnBu/j3tX2jYEjYBaaT+v74L+Nze/d66xxE06hItlKddSTS0KacQj9
// +KLXCJKCmwKBgQCVdofO5tw+OCKUDRYFesubzD7eWmurYCUGyn8xS/SOf0hx89T7
// 5tR7Z8ZfaVOiImJE2aykLiP4Jzpx+PhNjv+2d1XAgNDF+VD3NTwvW6K/xEqS915v
// Ma+B+DsjcXm+Nd6WL5t2LdBLpmcohhyze4OWl8UR9fkf8VXnludDpzO9KQKBgEIY
// fG7somm8T+4XBu2faBSOs+bRhNZSfpNaj/3Qe5jdY0V62kJ/e1HXNjpDLQcMal4d
// 161YMYah5+FW+N4eghMOPfDejL4kmUuuLxHaXYyWBe4qcdql28ECLMz5ljvRh7OU
// FGG8xRxb+olNr7Kohz905nK8cPv5tNfpxgJjR8VlAoGASUGqBKvGzld32abLOg93
// FebHFB0cJoxkrbfx7Fw98JIHLZABk6FuzxiO1I4fsUSXRzMOj9E6kT171z/1ocpB
// sikoUvtPcc1mazgNFf1fMer12BM/QFY7qdfibBuVU+ClGmj8bd3lahhWsvO4xCto
// NJhaJ7bnqsrSjHxf+XBA7Fk=
// ''';

const String _kAppId = 'AP23021640379390003537';
const String _kPartnerId = 'PAT23021640155283006022';
const String _kPrivateKey =
    'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCUx2lA3XUEzkwCtSO3vPwh9iEI9ZZPz9YEoH+IoANC4npsNiRwniJVHRHwKxfmRk2bgexodHoikmXwDXvTOsbXIiCz+gGQjZF/uicY8jefddOf/n9rv0ogdSbdrqlFWVocjkjNIpyLVAdmeeCPtCyAt/x6G7NY8JODwtdZv2d0gIpeRdvnuZN6+sKIaYR4t+d9CQj7Va/U2HknSSEXReSsyhKJ7oBySEftkHoF/0K5PQxl1NPVZ9QQrj4z3ONVBr9YAG7k2SExtNITEqO6xDjNt487bbWjgLmDlRgLAvS6fdNUpXCVMWWN+901diu5Ui3A+PsrIw5me7Sl9jx9hH1nAgMBAAECggEAdPehpEF3cmPOFoLapeWKRBkBN838cprvo4ubOIq0ha0Qmmqmk3N/gnLsW2lFzOCQuyWV+zk3nF6EjgnLw/F9yj0mgNiYylDChyyO+GnVmSRFUJABFXC6knIIMFjU85Sf57tlOQFxGYjimIpRJil8o2YCtO16Pv5Eu14/eGumpkwFmlE7SESpeU1XdzogPT6cTmYaNSTTCaSuciw2vJIaKOz5HT8sp/nFD0mFDXPwAXJojpPC+XbcqMCTifMbAtcCB/9CJHTT56sq2Xo9mji6/6hvFPM4r5lUGJI3f78Je1wAsPULT3Wb+u5dnpaKzqNnp2xNwwFeKpm3hfW+XyzJQQKBgQDFP5CQ5jt2DpktDXiM8S5Fp0mZFMyRF15He9TuxWuIDfGhPDcg94KumW+G8vAl44XAkM2bnAbATiqtBuQYw3UXF8KLwUqJmSS1pJBkhjfHS6cA+5pCqsEiqfOmGyCxJqvH6vQ7/u6jDgAxNn5s31QLhc70yqydvTcC2FUnDEiwWQKBgQDBF/8ZEwWg8PfUTMP5a63+ixF+q7uKRHHTlz+a1Z1vB2NkofY0sc+6yqVUgMeeJktFEevYWEEwOL1XDQVTwDQqHTeJaHxny8N5M45vMwG3Ffi2fN5Ap+4EWQNTR/5cK3kvxybwZV2Xv24Lmy2tYE/JGdrraTEX0tNwy9WR6PrjvwKBgF1bCmcqMLZdjm3eVFIQzF+3H4RObcu2Da8zksI3uf846kXvo//8ZWORx1FNpg+oseNEJawimqdl15jxDAAUclStsCxJHagmTVOTQavyQnAXBEHY01f+TU7EtUbGzCBMNz11nIbQz81okPq52fhZcwPJHvyI+E3oAiNclGDY1YZxAoGAb6m72Lk6WQ7gkoHuFq/hh8DOVi1jn5rjJFRj8Ns1Vr60CL7sjR6CnWeQ4mQyi89jWcb6Vzr6P7OgMtYRzZPp1qzcr/afcrrQCKf6521cwY7QLF/bexJhv1vmY2PPwWdWhn2pk/1aeWW3crjDWm7G1OnBwr8rJ7bAlYsar21GoSsCgYBBzdidyVt0CDCI74GTFY1ZTzA3EKCTHte6lTYK9wjxYqgXYMWCi3F3uHWa1nBfCzNdcozUVVYcJyKxILfyQx0PG+wKfH95Ax9CkEJe+i9H+dEBpmueXIctOXAB+gWhR1vC1EVH6BdRiwDBY3II7O13Eg3tE6geBvw5CuJnUgL/VA==';
const String _kUserId = 'test_user';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VerifyblocFlutter _verifyblocFlutterPlugin = VerifyblocFlutter();

  // Locale
  final TextEditingController _localeController =
      TextEditingController(text: _kLocale);

  // App Data
  final TextEditingController _partnerIdController =
      TextEditingController(text: _kPartnerId);
  final TextEditingController _appIdController =
      TextEditingController(text: _kAppId);
  final TextEditingController _privateKeyController =
      TextEditingController(text: _kPrivateKey);

  // Theme
  final TextEditingController _themeColorController =
      TextEditingController(text: Colors.amber.hex);

  // Button
  final TextEditingController _btnColorController =
      TextEditingController(text: Colors.amber.hex);
  final TextEditingController _btnGradientBeginColorController =
      TextEditingController(text: Colors.orange.hex);
  final TextEditingController _btnGradientEndColorController =
      TextEditingController(text: Colors.purple.hex);
  final TextEditingController _btnTextColorController =
      TextEditingController(text: Colors.white.hex);
  final TextEditingController _btnRadiusController =
      TextEditingController(text: '8');

  // User
  final TextEditingController _userIdController =
      TextEditingController(text: _kUserId);

  Brightness _brightness = Brightness.dark;
  bool _isBtnGradient = false;
  VerifyblocIdentityType _identityType = VerifyblocIdentityType.personal;

  Color get _themeColor => _themeColorController.text.toColor;
  Color get _btnColor => _btnColorController.text.toColor;
  Color get _btnGradientBeginColor =>
      _btnGradientBeginColorController.text.toColor;
  Color get _btnGradientEndColor => _btnGradientEndColorController.text.toColor;
  Color get _btnTextColor => _btnTextColorController.text.toColor;
  double? get _btnRadius => double.tryParse(_btnRadiusController.text);
  String get _userId => _userIdController.text;

  @override
  void initState() {
    super.initState();

    // Switch env, default to [FlutterVerifyblocEnv.prd]
    _verifyblocFlutterPlugin.setEnv(VerifyblocEnv.dev);
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    const Widget spacing = SizedBox(height: 16);

    return Scaffold(
      appBar: AppBar(
        title: const Text('VerifyblocFlutter example app'),
      ),
      body: MediaQuery.removePadding(
        context: context,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            20,
            20,
            20,
            20 + mediaQuery.padding.bottom,
          ),
          children: <Widget>[
            ..._buildLocaleSection(context),
            spacing,
            ..._buildConfigSection(context),
            spacing,
            ..._buildModeSection(context),
            spacing,
            ..._buildThemeSection(context),
            spacing,
            ..._buildButtonSection(context),
            spacing,
            ..._buildUserSection(context),
            spacing,
            ElevatedButton(
              onPressed: _onTapStart,
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLocaleSection(BuildContext context) {
    return <Widget>[
      const SmallTitle('Locale'),
      CupertinoTextField(
        controller: _localeController,
      ),
    ];
  }

  List<Widget> _buildConfigSection(BuildContext context) {
    return <Widget>[
      const SmallTitle('App Data'),
      CupertinoTextField(
        prefix: const FieldPrefixText('Partner Id'),
        controller: _partnerIdController,
      ),
      CupertinoTextField(
        prefix: const FieldPrefixText('App Id'),
        controller: _appIdController,
      ),
      CupertinoTextField(
        prefix: const FieldPrefixText('Private Key'),
        controller: _privateKeyController,
      ),
    ];
  }

  List<Widget> _buildModeSection(BuildContext context) {
    return <Widget>[
      const SmallTitle('Brightness'),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Radio<Brightness>(
            value: Brightness.dark,
            groupValue: _brightness,
            onChanged: _onBrightnessChanged,
          ),
          const Text('Dark'),
          Radio<Brightness>(
            value: Brightness.light,
            groupValue: _brightness,
            onChanged: _onBrightnessChanged,
          ),
          const Text('Light'),
        ],
      ),
    ];
  }

  List<Widget> _buildThemeSection(BuildContext context) {
    return <Widget>[
      const SmallTitle('Theme'),
      ColorTextField(
        controller: _themeColorController,
        name: 'Color',
        value: _themeColor,
        onValueChanged: _onThemeColorChanged,
      ),
    ];
  }

  List<Widget> _buildButtonSection(BuildContext context) {
    return <Widget>[
      const SmallTitle('Bottom Button'),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Radio<bool>(
            value: false,
            groupValue: _isBtnGradient,
            onChanged: _onButtonGradientChanged,
          ),
          const Text('Solid'),
          Radio<bool>(
            value: true,
            groupValue: _isBtnGradient,
            onChanged: _onButtonGradientChanged,
          ),
          const Text('Gradient'),
        ],
      ),
      if (_isBtnGradient) ...<Widget>[
        ColorTextField(
          controller: _btnGradientBeginColorController,
          name: 'Begin',
          value: _btnGradientBeginColor,
          onValueChanged: _onBtnGradientBeginChanged,
        ),
        ColorTextField(
          controller: _btnGradientEndColorController,
          name: 'End',
          value: _btnGradientEndColor,
          onValueChanged: _onBtnGradientEndChanged,
        ),
      ] else
        ColorTextField(
          controller: _btnColorController,
          name: 'Background',
          value: _btnColor,
          onValueChanged: _onBtnColorChanged,
        ),
      ColorTextField(
        controller: _btnTextColorController,
        name: 'Text',
        value: _btnTextColor,
        onValueChanged: _onBtnTextColorChanged,
      ),
      CupertinoTextField(
        controller: _btnRadiusController,
        prefix: const FieldPrefixText('Radius'),
        keyboardType: TextInputType.number,
      ),
    ];
  }

  List<Widget> _buildUserSection(BuildContext context) {
    return <Widget>[
      const SmallTitle('User'),
      CupertinoTextField(
        prefix: const FieldPrefixText('User Id'),
        controller: _userIdController,
      ),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Radio<VerifyblocIdentityType>(
            value: VerifyblocIdentityType.personal,
            groupValue: _identityType,
            onChanged: _onIdentityTypeChanged,
          ),
          const Text('Personal'),
          Radio<VerifyblocIdentityType>(
            value: VerifyblocIdentityType.corporate,
            groupValue: _identityType,
            onChanged: _onIdentityTypeChanged,
          ),
          const Text('Corporate'),
        ],
      ),
    ];
  }

  void _onBrightnessChanged(Brightness? brightness) {
    setState(() {
      _brightness = brightness!;
    });
  }

  void _onThemeColorChanged(Color color) {
    setState(() {
      _themeColorController.text = color.hex;
    });
  }

  void _onButtonGradientChanged(bool? isGradient) {
    setState(() {
      _isBtnGradient = isGradient ?? false;
    });
  }

  void _onBtnGradientBeginChanged(Color color) {
    setState(() {
      _btnGradientBeginColorController.text = color.hex;
    });
  }

  void _onBtnGradientEndChanged(Color color) {
    setState(() {
      _btnGradientEndColorController.text = color.hex;
    });
  }

  void _onBtnColorChanged(Color color) {
    setState(() {
      _btnColorController.text = color.hex;
    });
  }

  void _onBtnTextColorChanged(Color color) {
    setState(() {
      _btnTextColorController.text = color.hex;
    });
  }

  void _onIdentityTypeChanged(VerifyblocIdentityType? identityType) {
    setState(() {
      _identityType = identityType!;
    });
  }

  void _onTapStart() {
    _verifyblocFlutterPlugin
      // Configure your app data before starting verification
      ..initialize(
        partnerId: _partnerIdController.text,
        appId: _appIdController.text,
        privateKey: _privateKeyController.text,
      )
      ..setAppLocale(_localeController.text)
      ..setTheme(VerifyblocTheme(
        style: _brightness == Brightness.dark
            ? VerifyblocStyle.dark
            : VerifyblocStyle.light,
        mainColor: _themeColor.value,
        buttonStyle: VerifyblocButtonTheme(
          color: _btnColor.value,
          gradient: _isBtnGradient
              ? (Int32List.fromList(<int>[
                  _btnGradientBeginColor.value,
                  _btnGradientEndColor.value,
                ]))
              : null,
          textColor: _btnTextColor.value,
          borderRadius: _btnRadius,
        ),
      ))
      // Start to verify
      ..startVerification(
        userId: _userId,
        identityType: _identityType,
      );
  }
}
