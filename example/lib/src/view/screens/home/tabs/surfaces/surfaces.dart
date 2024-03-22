import 'package:adp_mobile/adp_mobile.dart';

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/title.dart';
import 'bottom_sheet.dart';
import 'dialog.dart';
import 'list_tile.dart';

class Surfaces extends StatelessWidget {
  const Surfaces({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomTitle(
            path: HighlightPaths.listTile,
            title: 'List Tile',
            message:
                'AdaptiveListTile: A widget for displaying a single fixed-height row that typically contains some text as well as a leading or trailing icon.',
          ),
          ListTitlePreview(),
          CustomTitle(
            path: HighlightPaths.dialog,
            title: 'Dialog',
            message:
                'AdaptiveDialog: A type of modal window that appears in front of app content to provide critical information or ask for a decision.',
          ),
          DialogPreview(),
          CustomTitle(
            path: HighlightPaths.bottomSheet,
            title: 'Bottom Sheet',
            message:
                'AdaptiveBottomSheet: An alternative to a menu or a dialog that appears at the bottom of the screen. It prevents the user from interacting with the rest of the app.',
          ),
          BottomSheetPreview(),
        ],
      ),
    );
  }
}
