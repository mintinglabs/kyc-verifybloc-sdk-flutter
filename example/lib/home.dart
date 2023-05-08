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
const String _kAppId = 'AP23021640379390003537';
const String _kPartnerId = 'PAT23021640155283006022';
const String _kPrivateKey = '''
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCUx2lA3XUEzkwC
tSO3vPwh9iEI9ZZPz9YEoH+IoANC4npsNiRwniJVHRHwKxfmRk2bgexodHoikmXw
DXvTOsbXIiCz+gGQjZF/uicY8jefddOf/n9rv0ogdSbdrqlFWVocjkjNIpyLVAdm
eeCPtCyAt/x6G7NY8JODwtdZv2d0gIpeRdvnuZN6+sKIaYR4t+d9CQj7Va/U2Hkn
SSEXReSsyhKJ7oBySEftkHoF/0K5PQxl1NPVZ9QQrj4z3ONVBr9YAG7k2SExtNIT
EqO6xDjNt487bbWjgLmDlRgLAvS6fdNUpXCVMWWN+901diu5Ui3A+PsrIw5me7Sl
9jx9hH1nAgMBAAECggEAdPehpEF3cmPOFoLapeWKRBkBN838cprvo4ubOIq0ha0Q
mmqmk3N/gnLsW2lFzOCQuyWV+zk3nF6EjgnLw/F9yj0mgNiYylDChyyO+GnVmSRF
UJABFXC6knIIMFjU85Sf57tlOQFxGYjimIpRJil8o2YCtO16Pv5Eu14/eGumpkwF
mlE7SESpeU1XdzogPT6cTmYaNSTTCaSuciw2vJIaKOz5HT8sp/nFD0mFDXPwAXJo
jpPC+XbcqMCTifMbAtcCB/9CJHTT56sq2Xo9mji6/6hvFPM4r5lUGJI3f78Je1wA
sPULT3Wb+u5dnpaKzqNnp2xNwwFeKpm3hfW+XyzJQQKBgQDFP5CQ5jt2DpktDXiM
8S5Fp0mZFMyRF15He9TuxWuIDfGhPDcg94KumW+G8vAl44XAkM2bnAbATiqtBuQY
w3UXF8KLwUqJmSS1pJBkhjfHS6cA+5pCqsEiqfOmGyCxJqvH6vQ7/u6jDgAxNn5s
31QLhc70yqydvTcC2FUnDEiwWQKBgQDBF/8ZEwWg8PfUTMP5a63+ixF+q7uKRHHT
lz+a1Z1vB2NkofY0sc+6yqVUgMeeJktFEevYWEEwOL1XDQVTwDQqHTeJaHxny8N5
M45vMwG3Ffi2fN5Ap+4EWQNTR/5cK3kvxybwZV2Xv24Lmy2tYE/JGdrraTEX0tNw
y9WR6PrjvwKBgF1bCmcqMLZdjm3eVFIQzF+3H4RObcu2Da8zksI3uf846kXvo//8
ZWORx1FNpg+oseNEJawimqdl15jxDAAUclStsCxJHagmTVOTQavyQnAXBEHY01f+
TU7EtUbGzCBMNz11nIbQz81okPq52fhZcwPJHvyI+E3oAiNclGDY1YZxAoGAb6m7
2Lk6WQ7gkoHuFq/hh8DOVi1jn5rjJFRj8Ns1Vr60CL7sjR6CnWeQ4mQyi89jWcb6
Vzr6P7OgMtYRzZPp1qzcr/afcrrQCKf6521cwY7QLF/bexJhv1vmY2PPwWdWhn2p
k/1aeWW3crjDWm7G1OnBwr8rJ7bAlYsar21GoSsCgYBBzdidyVt0CDCI74GTFY1Z
TzA3EKCTHte6lTYK9wjxYqgXYMWCi3F3uHWa1nBfCzNdcozUVVYcJyKxILfyQx0P
G+wKfH95Ax9CkEJe+i9H+dEBpmueXIctOXAB+gWhR1vC1EVH6BdRiwDBY3II7O13
Eg3tE6geBvw5CuJnUgL/VA==
''';
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
