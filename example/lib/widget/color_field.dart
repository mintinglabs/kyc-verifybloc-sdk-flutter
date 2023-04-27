import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';

import 'field_prefix_text.dart';

class ColorTextField extends StatelessWidget {
  const ColorTextField({
    super.key,
    this.controller,
    required this.name,
    required this.value,
    required this.onValueChanged,
  });

  final TextEditingController? controller;
  final String name;
  final Color value;
  final ValueChanged<Color> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      prefix: FieldPrefixText(name),
      suffix: GestureDetector(
        onTap: () => _onTapColorPicker(
          context,
          value,
          onValueChanged,
        ),
        child: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: value,
            border: Border.all(),
            shape: BoxShape.circle,
          ),
          constraints: BoxConstraints.tight(const Size.square(20)),
        ),
      ),
    );
  }

  void _onTapColorPicker(
    BuildContext context,
    Color color,
    ValueChanged<Color> onColorChanged,
  ) {
    ColorPicker(
      // Use the dialogPickerColor as start color.
      color: color,
      // Update the dialogPickerColor using the callback.
      onColorChanged: onColorChanged,
      heading: const Text('Select color'),
      subheading: const Text('Select color shade'),
      wheelSubheading: const Text('Selected color and its shades'),
    ).showPickerDialog(context);
  }
}
