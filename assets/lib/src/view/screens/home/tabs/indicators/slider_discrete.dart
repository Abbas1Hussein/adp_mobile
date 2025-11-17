import 'package:adp_mobile/adp_mobile.dart';

class SliderDiscretePreview extends StatefulWidget {
  const SliderDiscretePreview({super.key});

  @override
  State<SliderDiscretePreview> createState() => _SliderDiscretePreviewState();
}

class _SliderDiscretePreviewState extends State<SliderDiscretePreview> {
  double currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveSlider(
      divisions: 15,
      value: currentValue,
      onChanged: (value) => setState(() => currentValue = value),
    );
  }
}
