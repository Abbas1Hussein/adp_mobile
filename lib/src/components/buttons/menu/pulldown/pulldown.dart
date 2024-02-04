// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../adp_mobile.dart';
//
// /// Defines the selection types for the pulldown menu button.
// enum SelectionType {
//   /// Represents the default selection type where no item is selected by default.
//   ///
//   /// When [AdaptivePulldownMenuItem.enabled] is false, the item will be disabled.
//   none,
//
//   /// When used, this selection type focuses on only one [AdaptivePulldownMenuItem].
//   ///
//   /// Example usage:
//   ///
//   /// ```dart
//   /// AdaptivePulldownMenuButton.singleChoice(
//   ///   title: 'Adp Menu',
//   ///   items: [
//   ///     AdaptivePulldownMenuItem(
//   ///       enabled: true,
//   ///       leading: AdaptiveIcon(AdpIcons.star),
//   ///       child: Text('Give us a star'),
//   ///     ),
//   ///   ],
//   /// ),
//   /// ```
//   /// - There should be exactly one item with the specified 'enabled' value set to true.
//   single,
// }
//
// /// Callback type for handling the selection of items in a pulldown menu.
// ///
// /// The [index] parameter represents the index of the selected item.
// /// The [value] parameter represents the selected value of generic type [T].
// typedef PulldownMenuSelectedCallback<T> = void Function(int index, T? value);
//
// /// A pulldown menu button is used to create a nice overlay on the screen,
// /// that allows the user to select any item from multiple options.
// ///
// /// Use a pull-down button to present a list of commands.
// ///
// /// - On macOS, [MacosPulldownButton] is utilized.
// /// - On Windows, [DropDownButton] is used.
// class AdaptivePulldownMenuButton<T> extends CoreAdaptiveComponent {
//   /// Creates an instance of AdaptivePulldownMenuButton.
//   ///
//   /// Example usage:
//   ///
//   /// ```dart
//   /// AdaptivePulldownMenuButton<String>(
//   ///   title: 'Adp Menu',
//   ///   onSelected: (String? value) {
//   ///     // Handle the selected value
//   ///   },
//   ///   items: const [
//   ///     AdaptivePulldownMenuItem(
//   ///       leading: AdaptiveIcon(AdpIcons.folderAdd),
//   ///       child: Text('New folder'),
//   ///     ),
//   ///     AdaptivePulldownMenuItem(
//   ///       leading: AdaptiveIcon(AdpIcons.folderOpen),
//   ///       child: Text('Open'),
//   ///     ),
//   ///     AdaptivePulldownMenuItem(
//   ///       leading: AdaptiveIcon(AdpIcons.wand),
//   ///       child: Text('Open with'),
//   ///     ),
//   ///     AdaptivePulldownMenuItem(
//   ///       leading: AdaptiveIcon(AdpIcons.delete),
//   ///       child: Text('Remove'),
//   ///       enabled: false, // this will disabled.
//   ///     ),
//   ///     AdaptivePulldownMenuItem(
//   ///       leading: AdaptiveIcon(AdpIcons.phone),
//   ///       child: Text('Import from phone ...'),
//   ///     ),
//   ///     AdaptivePulldownMenuDivider(),
//   ///     AdaptivePulldownMenuItem(
//   ///       leading: AdaptiveIcon(AdpIcons.star),
//   ///       child: Text('Give us a star'),
//   ///     ),
//   ///   ],
//   /// );
//   /// ```
//   ///
//   /// See also:
//   ///
//   /// * [AdaptivePulldownMenuButton.singleChoice] focuses on only one AdaptivePulldownMenuItem.
//   /// * [AdaptivePopupMenuButton]
//   const AdaptivePulldownMenuButton({
//     super.key,
//     super.builders,
//     super.properties,
//     this.onOpen,
//     this.onSelected,
//     this.focusNode,
//     this.pulldownColor,
//     this.autofocus = false,
//     this.disabled = false,
//     this.disabledTitle,
//     required this.title,
//     required this.items,
//   }) : _type = SelectionType.none;
//
//   /// When used, will focus on only one [AdaptivePulldownMenuItem].
//   ///
//   /// If [AdaptivePulldownMenuItem.enabled] is true, it will be focused.
//   ///
//   /// - Should be exactly one item with the specified 'enabled' value set to true.
//   ///
//   /// Example:
//   /// ```dart
//   /// AdaptivePulldownMenuItem(
//   ///   enabled: true,
//   ///   leading: AdaptiveIcon(AdpIcons.star),
//   ///   child: Text('Give us a star'),
//   /// ),
//   /// ```
//   const AdaptivePulldownMenuButton.singleChoice({
//     super.key,
//     super.builders,
//     super.properties,
//     this.onOpen,
//     this.onSelected,
//     this.focusNode,
//     this.pulldownColor,
//     this.autofocus = false,
//     this.disabled = false,
//     this.disabledTitle,
//     required this.title,
//     required this.items,
//   }) : _type = SelectionType.single;
//
//   /// The title text to be displayed on the pulldown button.
//   final String title;
//
//   /// The list of menu entries for the pull-down menu.
//   ///
//   /// Can be either [AdaptivePulldownMenuItem]s or [AdaptivePulldownMenuDivider]s.
//   final List<AdaptivePulldownMenuItemEntry<T>> items;
//
//   /// A callback function that is called when a menu item is selected.
//   ///
//   /// The callback will receive the value of the selected item as its argument.
//   final PulldownMenuSelectedCallback<T>? onSelected;
//
//   /// The pulldown color. If null,
//   ///
//   /// on windows: [FluentThemeData.menuColor] is used.
//   /// on macos: [MacosPulldownButtonTheme.pulldownColor] is used.
//   final Color? pulldownColor;
//
//   /// {@macro flutter.widgets.Focus.autofocus}
//   /// If true, the pulldown menu will automatically focus when displayed.
//   ///
//   /// Default is false.
//   final bool autofocus;
//
//   /// {@macro flutter.widgets.Focus.focusNode}
//   /// The focus node to control the focus behavior of the pulldown menu.
//   final FocusNode? focusNode;
//
//   /// If true, the pulldown button won't be clickable.
//   ///
//   /// Default is false.
//   final bool disabled;
//
//   /// The text that is displayed when the pull-down is disabled.
//   ///
//   /// If the pulldown is [disabled], this is displayed as a
//   /// title for the pull-down button.
//   final String? disabledTitle;
//
//   /// Called when the pull-down button is tapped.
//   ///
//   /// The callback will not be invoked if the pull-down button is disabled.
//   final VoidCallback? onOpen;
//
//   /// The selection type for the pulldown menu button.
//   ///
//   /// - `SelectionType.single`: Enables single-item selection.
//   /// - `SelectionType.none`: No item is selected by default.
//   final SelectionType _type;
//
//   @override
//   Widget android(BuildContext context, [CoreAndroidProperty? property]) {
//     return PopupMenuButton<T>(
//       onSelected: (value) {},
//       itemBuilder: (context) {
//         return items
//             .map((e) {
//               if (e is AdaptivePulldownMenuItem<T>) {
//                 return PopupMenuItem(
//                   onTap: e.onTap,
//                   child: e.buildListTile(context),
//                 );
//               }
//               return const PopupMenuDivider();
//             })
//             .whereType<PopupMenuEntry<T>>()
//             .toList();
//       },
//     );
//   }
//
//   @override
//   Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
//     return AdaptiveIconButton(
//       onPressed: () {
//         showCupertinoModalPopup(
//           context: context,
//           builder: (BuildContext context) {
//             return CupertinoActionSheet(
//               actions: items
//                   .map((e) {
//                     if (e is AdaptivePulldownMenuItem<T>) {
//                       return CupertinoListTile(
//                         leadingSize: 28.0,
//                         leadingToTitle: 16.0,
//                         onTap: e.onTap,
//                         title: e.child,
//                         leading: e.leading,
//                         trailing: e.trailing,
//                       );
//                     }
//                     return const SizedBox.shrink();
//                   })
//                   .whereType<CupertinoListTile>()
//                   .toList(),
//               cancelButton: CupertinoActionSheetAction(
//                 child: const Text('Cancel'),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             );
//           },
//         );
//       },
//       icon: const Icon(CupertinoIcons.decrease_quotelevel),
//     ).iOS(context);
//   }
//
// // void validateSelectedItem() {
// //   assert(
// //   items.isNotEmpty,
// //   "Validation failed in the $runtimeType.\n"
// //       "The list of items should not be empty.",
// //   );
// //
// //   if (_type == SelectionType.single) {
// //     // Filter items to include only selected items (if applicable)
// //     final selectedItems =
// //     items.whereType<AdaptivePulldownMenuItem<T?>>().where((item) {
// //       return item.enabled ?? false;
// //     });
// //
// //     // Check if there is exactly one selected item
// //     final hasUniqueSelectedItem = selectedItems.length == 1;
// //
// //     assert(
// //     hasUniqueSelectedItem,
// //     "Validation failed in $runtimeType.\n\n"
// //         "There should be exactly one item with the specified 'selected' value set to true.\n"
// //         "Ensure that there is only one AdaptivePulldownMenuItem in the list with 'selected: true'.",
// //     );
// //   }
// // }
// }
