import 'package:adp_mobile/adp_mobile.dart';

class SelectionButtons extends StatefulWidget {
  const SelectionButtons({super.key});

  @override
  State<SelectionButtons> createState() => _SelectionButtonsState();
}

class _SelectionButtonsState extends State<SelectionButtons> {
  bool _checkboxValue = false;
  bool _switchValue = false;
  int? _radioValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AdaptiveCheckbox(
          label: const Text('Checkbox'),
          value: _checkboxValue,
          onChanged: (value) {
            setState(() => _checkboxValue = value);
          },
        ),
        AdaptiveSwitch(
          label: const Text('Switch'),
          value: _switchValue,
          onChanged: (value) {
            setState(() => _switchValue = value);
          },
        ),
       // const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdaptiveRadio(
              value: 0,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() => _radioValue = value);
              },
              label: const Text('Radio 1'),
            ),
            const SizedBox(width: 10.0),
            AdaptiveRadio(
              value: 1,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() => _radioValue = value);
              },
              label: const Text('Radio 2'),
            ),
            const SizedBox(width: 10.0),
            AdaptiveRadio(
              value: 2,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() => _radioValue = value);
              },
              label: const Text('Radio 3'),
            ),
          ],
        ),
      ],
    );
  }
}
