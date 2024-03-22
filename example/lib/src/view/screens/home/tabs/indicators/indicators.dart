import 'package:adp_mobile/adp_mobile.dart';

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/title.dart';
import 'circular_progress_indicator.dart';
import 'slider_continuous.dart';
import 'slider_discrete.dart';

class Indicators extends StatelessWidget {
  const Indicators({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTitle(
          path: HighlightPaths.circularProgressIndicator,
          title: 'Circular Progress Indicator',
          message:
              'AdaptiveCircularProgressIndicator: A circular progress indicator widget that can be indeterminate (spinning) or determinate (shows progress).',
        ),
        CircularProgressIndicatorPreview(),
        CustomTitle(
          path: HighlightPaths.sliderContinuous,
          title: 'Slider Continuous',
          message:
              'AdaptiveSlider: A slider widget for selecting a value from a continuous range by dragging or pressing on the desired position.',
        ),
        SliderContinuousPreview(),
        CustomTitle(
          path: HighlightPaths.sliderDiscrete,
          title: 'Slider Discrete',
          message:
              'AdaptiveSlider: A slider widget with divisions for selecting a value from a discrete range by moving a thumb control along a track.',
        ),
        SliderDiscretePreview(),
      ],
    );
  }
}
