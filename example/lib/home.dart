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
const String _kAppId = 'AP23060624658111047829';
const String _kPartnerId = 'PAT23060624364028044783';
const String _kPrivateKey = '''
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC0K2dIx85wUvHB
1zY4kxJ5nqBSvatEmBFIajb6apA7YD4NeFna+0RCJENd1NcJn4m9+SQQc5GfzyE8
ncCGWxwOaskHF3TKTph4xsJU1O1ocqsQl4I2zib+SE4r2c55jz/D44KX1i7f4bAh
CMcVH8Lqs8GV9HvDTdKqnCmOS9V5zx74kzsuShp7uYLiLY39+zsQ4K1mJoiWIpvi
cJTCCd/yAIJ6SwDYS1YwEW/yfj/jhEupswAxCiRcVQZUJCkqG8Yvql2bPxczelE3
EAcH9cwLY2VM7BYjSo0DKdGsMH/nF/qDuYJg2NQ9dXzWBkaUsUK69FS8NGjwjOM1
qbtlbtHBAgMBAAECggEAKmOH0lTIGh85p+x1Ykwf7aNHfxAGyoWok0wCEVqfAok7
MDofkejJ/3G+s8XOrgHuC1chiAlYuqul2zgWQsYOzMmM8HExViO1tby1nfXWwVsx
Kh8rUK+h9vOWCLUe4fS1AOZ3JDgNITldEfiZtjuZxVRzeE9kCug1Z1SEZmkrGZQf
NGd9oIqnslPJA9SiFWVbw6K0tzdSdDaIvIHcg3t8Z8ffANjUsfWT8MlsnH+ZsxIU
4TyiCQzu25p2aGxW1+HdzyiK5q668eIiANybqnuAfBjxZ4oRq/QLANKM5Y8sSYwe
i8cqU8vfPbeY1JAllDChzTS5hqsgkt2Z7EUik5+ALQKBgQDi7HOtFdZ1WppQT2xo
hWCpAiuHBnP1ke/1m+XVBB42+Titplhp731yvp2RtcMp+BrsHYcYn7GXSiTFOCSl
Lh5++9ehG77Dlg8xuXW2AldV67VfjJ8oBk2O1PEAX3i2vR3dx8TNZFBCPJo9+S4K
dGUsg0kS+ts5CgC8Fc7nh8T9JwKBgQDLQVLwxBZ3NMFNcXA1bQ60gjCFKTkL7Sc6
QaabuXiSFq2E9MH3m63ldnGrgATQ1ySjWTVuGzNDMiTMU5a68+zYrTN6+rNrfwzr
ik96fpW6lYlfHdVWA4Yu7cskvnaSeotJUI57MULN6dS2JtxZm3h3adnMmUZWvB/K
DP4xvh3a1wKBgC31R4RBjPqdi+1B+Km+gZIZH2msU+XjVZ7/oO+gcuIdXW5F51gl
KdoIYu80yb8BQaqaXFcPWK9UU9ghg8J0cba0GLrHXL5N8OvYLM/c74U2RLiCSWWY
yTJpTBoQO+l+qcLWB7S1YU/Y6EAu7DUv16HJQQ54Adguf3GYVRwtMic3AoGBAKdf
SHxJDLLm91LdWeg0wQo1ttzAoGBIzqezTg4oAbhTAlpc7qkGQoGVMm9mQRD0SRBW
MqBTt7fav+Cd6J5UpTGcFqtrbHnVqn7/awlU2dlGsFNqDrYAuutEF6dPS/a9AJvD
wUCCxR8pMWc5wvPrCZ1Txe0sPnbH/Wl1n5C4nH8LAoGATtJvCDPK2vfzGOmKDtz/
DOhzCermETGqHzBLxUuGEgnextzfR39uUxPB5JZ9oxxeQuxDAecKx4ODARma7E4n
VOkliUrecZ2az8l1qSWN1pkLay+7H9ALzhA+KiUDQxFNZB4nC+sPOvv9ixWMxhZb
vUW2yX/XI//SDNCFwC0uDwY=
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

    // Switch env, default to [VerifyblocEnv.prd]
    _verifyblocFlutterPlugin.setEnv(VerifyblocEnv.uat);
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
