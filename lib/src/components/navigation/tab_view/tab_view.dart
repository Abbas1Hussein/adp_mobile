import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../tab_bar/tab_bar.dart';

const kContentPadding = EdgeInsets.all(8.0);

/// The tab view is top-level for your app, facilitates the organization of content into separate tabs,
/// enabling users to navigate between different sections of the application.
/// It provides a visually appealing and intuitive way to present and switch between related information.
/// The Tab View consists of tabs along with their corresponding content, making it easy for users to access specific sections quickly.
/// This widget is customizable and adaptable, suitable for various application designs and platforms.
///
/// See also:
///
///   * [AdaptiveNavigationView], control provides top-level navigation for your app.
class AdaptiveTabView extends CoreAdaptiveComponent {
  /// Creates a adaptive tab view
  ///
  /// A tab view contains a row of navigational items, [tabBar.tabs], that move the
  /// user through the provided views ([children]). The user selects the desired
  /// page by clicking the appropriate tab.
  ///
  /// - [tabBar.tabs] must have at least 2 items and must be equal to the length of [children].
  const AdaptiveTabView({
    super.key,
    this.physics,
    this.primaryColor,
    this.secondaryColor,
    this.contentMargin,
    this.contentPadding = kContentPadding,
    this.dragStartBehavior = DragStartBehavior.down,
    this.clipBehavior = Clip.hardEdge,
    this.viewportFraction = 1.0,
    required this.tabBar,
    required this.children,
  });

  /// The tab bar associated with the tab view.
  ///
  /// The `tabBar` parameter represents the tab bar widget containing tabs for navigation
  /// within the tab view. It provides functionality to switch between different sections
  /// of the application.
  final AdaptiveTabBar tabBar;

  /// List of widgets representing the body of each tab view.
  ///
  /// Each widget corresponds to a tab in the [tabBar.tabs]. The list should have the same length
  /// as the number of tabs.
  final List<Widget> children;

  /// Padding around the content within each [children] body in the tab view.
  ///
  /// The `contentPadding` parameter allows you to specify padding around the children content,
  /// Default 8.0 is applied.
  final EdgeInsetsGeometry contentPadding;

  /// Margin around the content within each [children] body in the tab view.
  ///
  /// If `contentMargin` is provided, it determines the margin around the children content
  /// If `null`, the default margin is used based on the underlying platform:
  /// - On macOS: `12.0` is used,
  /// - On Windows: `zero` margin is applied.
  final EdgeInsetsGeometry? contentMargin;

  /// The primary background color of the tab view.
  ///
  /// The `primaryColor` parameter allows you to specify the background color of the entire
  /// tab view. If `null`, the default background color of the underlying platform is used.
  final Color? primaryColor;

  /// The secondary background color of the tab view.
  ///
  /// The `secondaryColor` parameter allows you to specify the secondary background color of the entire
  /// tab view. If `null`, the default secondary background color of the underlying platform is used.
  final Color? secondaryColor;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// How the page view should respond to user input.
  ///
  /// For example, determines how the page view continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.pageview.viewportFraction}
  final double viewportFraction;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// Wraps the children widgets with padding and colored boxes.
  ///
  /// The `_childrenWrapper` method wraps each child widget with padding and a colored box
  /// based on the specified content margin and secondary color. This ensures consistent
  /// spacing and visual presentation of the children within the tab view.
  List<Widget> get _childrenWrapper {
    return children.map(
      (child) {
        return Padding(
          padding: contentMargin ?? EdgeInsets.zero,
          child: ColoredBox(
            color: secondaryColor ?? Colors.transparent,
            child: Padding(padding: contentPadding, child: child),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    validate();
    return super.build(context);
  }

  @override
  Widget android(BuildContext context, [CoreAndroidProperty? property]) {
    return Material(color: primaryColor, child: _buildTabView());
  }

  @override
  Widget iOS(BuildContext context, [CoreIOSProperty? property]) {
    return CupertinoPageScaffold(
        backgroundColor: primaryColor, child: _buildTabView());
  }

  Widget _buildTabView() {
    return SafeArea(
      child: Column(
        children: [
          tabBar,
          Expanded(
            child: TabBarView(
              physics: physics,
              clipBehavior: clipBehavior,
              controller: tabBar.controller,
              viewportFraction: viewportFraction,
              dragStartBehavior: dragStartBehavior,
              children: _childrenWrapper,
            ),
          ),
        ],
      ),
    );
  }

  /// Validates the tab view configuration.
  ///
  /// The `validate` method ensures that the tab view configuration is valid
  /// before rendering. It verifies:
  /// - The length of the `tabs` list must be equal to the length of the `children` list.
  void validate() {
    assert(
      tabBar.tabs.length == children.length,
      '\nTabs and children lists must have the same length.\n'
      'The length of tabs (${tabBar.tabs.length}) must be equal to the length of children (${children.length}).',
    );
  }
}
