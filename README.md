[![pub package](https://img.shields.io/pub/v/adp_mobile.svg)](https://pub.dartlang.org/packages/adp_mobile)
[![GitHub](https://img.shields.io/github/license/Abbas1Hussein/adp_mobile)](https://github.com/Abbas1Hussein/adp_mobile/blob/main/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Abbas1Hussein/adp_mobile)](https://github.com/Abbas1Hussein/adp_mobile/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Abbas1Hussein/adp_mobile)](https://github.com/Abbas1Hussein/adp_mobile/network)

![logo](https://i.imgur.com/2KHNJfH.png)

Use this package to create adaptive apps on mobile. With just one codebase, you can preview your app on both Android and IOS platforms, regardless of the device you're used.

The `adp_mobile_preview` [here](https://github.com/Abbas1Hussein/adp_mobile_preview) a simple tool for previewing the `adp_mobile` package on desktop as an emulator.
This can be useful for developers who want to test their mobile applications on desktop environments,
without needing to deploy them to actual mobile devices.

## Usage
First, you need to initialize the `DefaultsPlatformManager`. Here's how you can do it:

```dart
import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/foundation.dart';

void main() async {
  DefaultsPlatformManager.initialize(
    // Specify the target platform (Android or IOS)
    targetPlatform: DesktopTargetPlatform.iOS,
    // If set to false, the targetPlatform parameter will be ignored, and the specific widget behavior will depend on the base platform.
    isDebugging: !kReleaseMode,
  );

  /// root widget of your Flutter application is `AdpApp()`.
  runApp(const App());
}
```

## Table of Contents

<details>
<summary>Buttons</summary>

### Basic Buttons

- [General Button](#general-buttons)
- [Icon Button](#icon-button)
- [Text Button](#text-button)

### Menus

- [Pulldown Menu Button](#pulldown-menu-button)
- [Popup Menu Button](#popup-menu-button)

### Selection Buttons

- [Checkbox](#checkbox)
- [Switch Button](#switch-button)
- [Radio Button](#radio-button)

### Navigation Buttons

- [Back Button](#back-button)
- [Close Button](#close-button)
</details>

<details>
<summary>Fields</summary>

  - [Text Field](#text-field)
  - [Text Form Field](#text-form-field)
  - [Text Search Field](#text-search-field)
  - [Autocomplete Field](#autocomplete-field)
</details>

<details>
<summary>Icon</summary>

  - [Icon](#icon)
  - [Icons](#icons)
</details>

<details>
<summary>Indicators</summary>

  - [Circular Progress Indicator](#circular-progress-indicator)
  - [Refresh Indicator](#refresh-indicator)
  - [Slider](#slider)
</details>

<details>
<summary>Layout</summary>

  - [Scaffold](#scaffold)
  - [Scaffold Page](#scaffold-page)
  - [Scrollbar](#scrollbar)
</details>

<details>
<summary>Navigation</summary>

  - [Navigation View](#navigation-view)
  - [Tab Bar](#tab-bar)
  - [Tab View](#tab-view)
</details>

<details>
<summary>Pickers</summary>

  - [Date Picker](#date-picker)
  - [Time Picker](#time-picker)
</details>

<details>
<summary>Surfaces</summary>

  - [Dialog](#dialog)
  - [Bottom Sheet](#bottom-sheet)
  - [List Tile](#list-tile)
</details>

<details>
<summary>Additional</summary>

  - [adaptiveValue](#adaptiveValue)
  - [AdaptiveBuilder](#adaptive-builder-widget)
  - [AdaptiveWidget](#adaptive-widget)
  - [AdaptiveBrightness](#brightness)
  - [AdaptiveTypography](#typography)
  - [Color's](#colors)

  - [Material widgets](#material-widgets)
</details>

## Buttons

### General Buttons
| IOS Dark\Light Mode                           | Android Dark\Light Mode                       |
| --------------------------------------------- | ----------------------------------------------|
| ![IOS Dark Mode](https://i.imgur.com/lwU34XO.png)  | ![Android Dark Mode](https://i.imgur.com/f9dsUOu.png) |
| ![IOS Light Mode](https://i.imgur.com/TRzSbL7.png) | ![Android Light Mode](https://i.imgur.com/D88uQwM.png) |

#### Base Button
This is a basic button that serves as a fundamental interactive element in the user interface.
It typically triggers primary actions or functions when clicked or tapped.
The base button doesn't have any specific visual styles beyond the default button appearance provided by the platform.

```dart
AdaptiveButton(
  child: const Text('Base Button'),
  onPressed: () {},
),
```

#### Filled Button
A filled button is similar to a base button but is optimized for use within form fields or input areas.
It may have slightly different visual properties to indicate its association with a form, such as a different background color or border style.

```dart
AdaptiveButton.filled(
  child: const Text('Filled Button'),
  onPressed: () {},
),
```

#### Outlined Button
A button with an outline border, providing a subtle visual cue compared to solid buttons.
It often represents secondary actions or less prominent options.

```dart
AdaptiveButton.outlined(
  child: const Text('Outlined Button'),
  onPressed: () {},
),
```

#### Icon Button
It is one of the most widely used buttons in the flutter library typically contains an icon.
It is commonly used to trigger actions or events in response to user interaction, such as tapping or clicking.
If the onPressed callback is null, then the button will be disabled and will not react to touch.

| IOS Dark\Light Mode                           | Android Dark\Light Mode                        |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/vuGp8jI.gif) | ![Android Dark Mode](https://i.imgur.com/su3aIks.gif) |
| ![IOS Light Mode](https://i.imgur.com/xAuMoeb.gif)| ![Android Light Mode](https://i.imgur.com/c8CEDF4.gif) |

```dart
AdaptiveIconButton(
  onPressed: () {},
  icon: const AdaptiveIcon(AdpIcons.add),
),
```

#### Text Button
A textButton widget is just a text label displayed on a zero-elevation Material widget.
By default, it does’t have visible borders and reacts to touches by filling with a background color.
If the onPressed && onLongPress callbacks is null, then the button will be disabled and will not react to touch.

| IOS Dark\Light Mode                           | Android Dark\Light Mode                        |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/tdDNuta.gif) | ![Android Dark Mode](https://i.imgur.com/PrnR7Lm.gif) |
| ![IOS Light Mode](https://i.imgur.com/IjF2WC1.gif)| ![Android Light Mode](https://i.imgur.com/fUIwtJx.gif) |

```dart
AdaptiveTextButton(
  onPressed: () {},
  child: const Text('Text Button'),
),
```

### Menus

#### Pulldown Menu Button
A pull-down menu button is used to create a nice overlay on the screen, allowing the user to select an item from multiple options.
The `AdaptivePulldownMenuButton.singleChoice` constructor option focuses on only one `AdaptivePulldownMenuItem`.
If `enabled` is true, it will be focused. There should be exactly one item with the specified 'enabled' value set to true.

| IOS Dark\Light Mode                           | Android Dark\Light Mode                        |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/zfLjhGj.gif) | ![Android Dark Mode](https://i.imgur.com/4q34ofl.gif) |
| ![IOS Light Mode](https://i.imgur.com/xQivv32.gif)| ![Android Light Mode](https://i.imgur.com/TItI5Yu.gif) |

```dart
AdaptivePulldownMenuButton(
  items: [
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.folderAdd),
      child: Text('New folder'),
    ),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.folderOpen),
      child: Text('Open'),
    ),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.wand),
      child: Text('Open with'),
    ),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.delete),
      child: Text('Remove'),
      enabled: false, // this will disabled.
    ),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.phone),
      child: Text('Import from phone ...'),
    ),
    AdaptivePulldownMenuDivider(),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.star),
      child: Text('Give us a star'),
    ),
  ],
),
```

#### Popup Menu Button
A pop-up button (often referred to as a pop-up menu) is a type of button
that, when clicked, displays a menu containing a list of mutually exclusive choices.
A pop-up button includes a double-arrow indicator that alludes to the
direction in which the menu will appear (only vertical is currently supported).

| IOS Dark\Light Mode                           | Android Dark\Light Mode                        |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/aaPmuOE.gif) | ![Android Dark Mode](https://i.imgur.com/Y9FfqjR.gif) |
| ![IOS Light Mode](https://i.imgur.com/odf5l26.gif)| ![Android Light Mode](https://i.imgur.com/9yTO2QD.gif) |

```dart
AdaptivePopupMenuButton<int>(
  value: _currentValue,
  onChanged: (value) {
    setState(() {
      _currentValue = value!;
    });
  },
  items: const [
    AdaptivePopupMenuItem(value: 0, child: Text('Blue')),
    AdaptivePopupMenuItem(value: 1, child: Text('Green')),
    AdaptivePopupMenuItem(value: 2, child: Text('Red')),
    AdaptivePopupMenuItem(value: 3, child: Text('Yellow')),
    AdaptivePopupMenuItem(value: 4, child: Text('Purple')),
    AdaptivePopupMenuItem(value: 5, child: Text('Orange')),
  ],
),
```

### Selection Buttons

#### Checkbox
A checkbox is a type of button that lets the user choose between
two opposite states, actions, or values. A selected checkbox is
considered on when it contains a checkmark and off when it's empty.
A checkbox is almost always followed by a title unless it appears in
a checklist.

| IOS Dark\Light Mode                           | Android Dark\Light Mode                        |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/BckRa1M.gif) | ![Android Dark Mode](https://i.imgur.com/S58xv4F.gif) |
| ![IOS Light Mode](https://i.imgur.com/rwGgXNC.gif)| ![Android Light Mode](https://i.imgur.com/y7mUqMe.gif) |

```dart
AdaptiveCheckbox(
  value: _checkboxValue,
  onChanged: (value) {
    setState(() {
      _checkboxValue = value;
    });
  },
),
```
```dart
AdaptiveCheckboxListTile(
  title: const Text('Checkbox ListTile'),
  value: currentIndex,
  onChanged: (value) {
    setState(() {
      currentIndex = value;
    });
  },
),
```

#### Switch Button
The switch represents a physical switch that allows users to turn
things on or off, like a light switch. Use switch controls to present
users with two mutually exclusive options (such as on/off), where choosing an option provides immediate results.
Use a switch for binary operations that take effect right after the
user flips the switch,Think of the switch as a physical power switch for a device: you flip
it on or off when you want to enable or disable the action performed by the device.

| IOS Dark\Light Mode                           | Android Dark\Light Mode                        |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/xzyfioV.gif) | ![Android Dark Mode](https://i.imgur.com/zS1yY7i.gif) |
| ![IOS Light Mode](https://i.imgur.com/H7fw9Kg.gif)| ![Android Light Mode](https://i.imgur.com/jhiqYTd.gif) |

```dart
AdaptiveSwitch(
  value: _currentValue,
  onChanged: (bool newValue) {
    setState(() {
      _currentValue = newValue;
    });
  },
),
```
```dart
AdaptiveSwitchListTile(
  title: const Text('Switch ListTile'),
  value: currentIndex,
  onChanged: (value) {
    setState(() {
      currentIndex = value;
    });
  },
),
```

#### Radio Button
Also called option buttons, let users select one option from
a collection of two or more mutually exclusive, but related, options. Radio
buttons are always used in groups, and each option is represented by one radio button in the group.
In the default state, no radio button in a RadioButtons group is selected.
That is, all radio buttons are cleared. However, once a user has selected a
radio button, the user can't deselect the button to restore the group to its
initial cleared state.

The singular behavior of a RadioButtons group distinguishes it from check
boxes, which support multi-selection and deselection, or clearing.

| IOS Dark\Light Mode                           | Android Dark\Light Mode                        |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/ZAxaQk3.gif)  | ![Android Dark Mode](https://i.imgur.com/xprrMW3.gif) |
| ![IOS Light Mode](https://i.imgur.com/jCVsDek.gif) | ![Android Light Mode](https://i.imgur.com/g2IaGiC.gif) |

```dart
AdaptiveRadio<SingingCharacter>(
  value: SingingCharacter.lafayette,
  groupValue: _character,
  onChanged: (SingingCharacter? newValue) {
    setState(() {
      _character = newValue;
    });
  },
),
```
```dart
AdaptiveRadioListTile(
  value: SingingCharacter.lafayette,
  groupValue: _character,
  onChanged: (SingingCharacter? newValue) {
    setState(() {
      _character = newValue;
    });
  },
),
```

### Navigation Buttons

#### Back Button
The back button is a user interface element used to navigate to the previous screen or step in an application's flow.
It provides users with a way to return to the previous context or view.

```dart
AdaptiveBackButton(),
```

#### Close Button
The close button is a user interface element used to dismiss or close a window, dialog, or modal.
It allows users to exit the current context or cancel an action.

```dart
AdaptiveCloseButton(),
```

## Fields

### Text Field
The TextField widget in Flutter is a fundamental input component used to collect text input from the user,
it allows users to enter and edit text interactively.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/HFGQPoQ.gif) | ![Android Dark Mode](https://i.imgur.com/mbvcO39.gif) |
| ![IOS Light Mode](https://i.imgur.com/aHvp4O6.gif)| ![Android Light Mode](https://i.imgur.com/qlb0QoG.gif) |

```dart
AdaptiveTextField(),
```

### Text Form Field
The TextFormField widget in Flutter is an enhanced version of the TextField widget,
specifically designed to be used within a Form widget to enable form validation and submission.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/Fnllw1W.gif) | ![Android Dark Mode](https://i.imgur.com/Q3lKIkf.gif) |
| ![IOS Light Mode](https://i.imgur.com/3YU4qYX.gif)| ![Android Light Mode](https://i.imgur.com/s6NnMgC.gif) |

```dart
Form(
  key: _formKey,
  child: AdaptiveTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    onFieldSubmitted: (value) {
      _formKey.currentState?.validate();
    },
  ),
),
```

### Text Search Field
A search field lets people search a collection of content for specific terms they enter.
A search field is an editable text field that often displays a Search button, a Clear button,
and optional placeholder text.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/zVzctlO.gif) | ![Android Dark Mode](https://i.imgur.com/r941BUH.gif) |
| ![IOS Light Mode](https://i.imgur.com/KCutnU4.gif)| ![Android Light Mode](https://i.imgur.com/gfSD3uD.gif) |

```dart
AdaptiveTextSearchField(),
```

### Autocomplete Field
A Text Search Field with auto complete suggestion is a user interface component typically used in applications to
allow users to input text queries and receive real-time suggestions or predictions based on the entered text.
It combines a text input field with a dropdown or list of suggestions that dynamically updates as the user types.
This widget provides a convenient way for users to find relevant information quickly without having to type the entire query themselves.
It enhances the user experience by offering predictive text suggestions, which can save time and effort.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/7T8gAYE.gif) | ![Android Dark Mode](https://i.imgur.com/3sHMdjE.gif) |
| ![IOS Light Mode](https://i.imgur.com/jjTVkRW.gif)| ![Android Light Mode](https://i.imgur.com/OE2Z85R.gif) |

```dart
AdaptiveAutocompleteField(
  options: [
    AdaptiveAutocompleteItem(searchKey: 'John Doe'),
    AdaptiveAutocompleteItem(searchKey: 'Jane Smith'),
    AdaptiveAutocompleteItem(searchKey: 'Michael Johnson'),
    AdaptiveAutocompleteItem(searchKey: 'Emily Davis'),
    AdaptiveAutocompleteItem(searchKey: 'Daniel Brown'),
    AdaptiveAutocompleteItem(searchKey: 'Olivia Wilson'),
    AdaptiveAutocompleteItem(searchKey: 'James Taylor'),
    AdaptiveAutocompleteItem(searchKey: 'Alexander Anderson'),
    AdaptiveAutocompleteItem(searchKey: 'Emma Garcia'),
    AdaptiveAutocompleteItem(searchKey: 'Sophia Martinez'),
  ],
),
```

## Icon

### Icon
Icon are graphical symbols used to represent actions, objects, or concepts within an application's user interface.
They provide visual cues that help users quickly understand and interact with the interface.

A basic adaptive icon that adjusts its appearance based on the platform.
```dart
AdaptiveIcon(AdpIcons.app),
```

An adaptive icon data with platform-specific designs for IOS and Android.
```dart
AdaptiveIcon.from(
 material: _iconAndroidData,
 cupertino: _iconIOSData,
),
```

An icon that remains consistent across all platforms.
```dart
AdaptiveIcon.all(Icons.code),
```

### Icons
Icons are a collection of predefined graphical symbols that represent common actions, objects, or concepts.
They provide visual cues that help users quickly understand and interact with the interface.

```dart
final AdpIcons adpIcon = AdpIcons.app,
final IconData iconData = adpIcon.platform, /// you can get platform iconData by using platform.
```

## Indicators

### Circular Progress Indicator
A progress widget that shows progress in a circular form,
A progress control provides feedback to the user that a long-running
operation is underway. It can mean that the user cannot interact with the
app when the progress indicator is visible, and can also indicate how long
the wait time might be.

It can be determinate or indeterminate:
If `value` is non-null, it should be between 0 and 1, representing the progress percentage.
If `value` is null, the circular progress will be considered indeterminate,
indicating that the progress is ongoing without a specific completion percentage.

| IOS Dark\Light Mode                         | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/5IwbaMc.gif) | ![Android Dark Mode](https://i.imgur.com/pRRs45J.gif) |
| ![IOS Light Mode](https://i.imgur.com/iccO10y.gif)| ![Android Light Mode](https://i.imgur.com/qyaGqjN.gif) |

```dart
AdaptiveCircularProgressIndicator(),
```

### Refresh Indicator
It is used to update the data in the app, refresh indicator will trigger a refresh when the list is over-scrolled.
It is showing a platform circular progress indicator if you want something to happen, add a callback function with the onRefresh property.

```dart
AdaptiveRefreshIndicator(
  onRefresh: () {
    // This function will be called when the user triggers a refresh
    // Add your refresh logic here

    // For example, you can call a function to fetch new data from a server.
    return fetchData();
  },
  child: const SingleChildScrollView(),
),
```

### Slider
A slider is a control that lets the user select from a range of values by
moving a thumb control along a track, A slider is a good choice when you know that users think of the value as a
relative quantity, not a numeric value. For example, users think about
setting their audio volume to low or medium — not about setting the value to
2 or 5.
| IOS Dark\Light Mode                         | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/6vbtWtn.gif) | ![Android Dark Mode](https://i.imgur.com/MeapycJ.gif) |
| ![IOS Light Mode](https://i.imgur.com/4lf0t03.gif)| ![Android Light Mode](https://i.imgur.com/2xbkgvg.gif) |

```dart
AdaptiveSlider(
  value: _currentValue,
  onChanged: (value) {
    setState(() {
      _currentValue = value;
    });
  },
),
```


## Layout

### Scaffold
We use this from the material library and adaptive it,
The scaffold is designed to be a top level container for a `AdpApp`.
This means that adding a Scaffold to each route on a adp app will provide the app with
platform's basic visual layout structure.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/BICG1RQ.png) | ![Android Dark Mode](https://i.imgur.com/Y3q1YgV.png) |
| ![IOS Light Mode](https://i.imgur.com/aA27b02.png)| ![Android Light Mode](https://i.imgur.com/mqDrIdA.png) |

```dart
AdaptiveScaffold(
  appBar: AdaptiveAppBar(
    title: const Text('Abbas Hussein'),
    actions: _actions,
  ),
  drawer: NavigationDrawer(
    selectedIndex: currentIndex,
    onDestinationSelected: (value) {
      setState(() {
        currentIndex = value;
      });
    },
    children: const [
      NavigationDrawerDestination(
        label: Text('Main Home'),
        icon: AdaptiveIcon(AdpIcons.home),
      ),
      NavigationDrawerDestination(
        label: Text('Series'),
        icon: AdaptiveIcon(AdpIcons.bookFilled),
      ),
      NavigationDrawerDestination(
        label: Text('Movies'),
        icon: AdaptiveIcon(AdpIcons.book),
      ),
    ],
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const AdaptiveIcon(AdpIcons.add),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  bottomNavigationBar: const AdaptiveBottomNavigationBar(
    items:  [
      AdaptiveBottomNavigationBarItem(
        label: 'app',
        icon: AdaptiveIcon(AdpIcons.app),
      ),
      AdaptiveBottomNavigationBarItem(
        label: 'archive',
        icon: AdaptiveIcon(AdpIcons.archive),
      ),
    ],
  ),
  body: const SizedBox.shrink(),
),
```
### Scaffold Page
The scaffold Page is a variant of the Scaffold widget designed specifically for use as a top-level container for individual pages within the app.
It includes an app bar with customizable actions and a content area for displaying the main content of the page.

```dart
AdaptiveScaffoldPage(
  appBar: AdaptiveAppBarPage(
    title: const Text('Abbas Hussein'),
    actions: _actions,
  ),
  content: const Center(
    child: Text("Give us a star"),
  ),
),
```

### Scrollbar
A scrollbar is a crucial interaction element in user interfaces, facilitating the navigation of content within a limited viewport.
It allows users to access all the content, even if it exceeds the available screen space,
by scrolling in various directions such as up, down, left, or right.

```dart
AdaptiveScrollbar(
  child: SingleChildScrollView(),
),
```

## Navigation

### Navigation View
The Navigation View top-level navigation for your app provides a structured layout for navigation within an application.
It typically consists of a sidebar for navigation options and an app bar for additional controls or indicators.
Provides a flexible layout for navigation purposes, allowing users to interact with the app's content seamlessly,
making it suitable for various application designs and platforms.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/EcdIJuE.png) | ![Android Dark Mode](https://i.imgur.com/iBVc1Ov.png) |
| ![IOS Light Mode](https://i.imgur.com/Q8hLC1u.png)| ![Android Light Mode](https://i.imgur.com/xZOhdkF.png) |

```dart
AdaptiveNavigationView(
  appBar: AdaptiveNavigationAppbar(
    title: const Text('Abbas Hussein'),
    actions: [
      AdaptiveIconButton(
        onPressed: () {},
        icon: const AdaptiveIcon(AdpIcons.add),
      ),
    ],
  ),
  navigationBar: AdaptiveNavigationBar(
    currentIndex: currentIndex,
    onChanged: (value) {
      setState(() => currentIndex = value);
    },
    items: const [
      AdaptiveNavigationBarItem(
        icon: AdaptiveIcon(AdpIcons.home),
        label: 'home',
      ),
      AdaptiveNavigationBarItem(
        icon: AdaptiveIcon(AdpIcons.archive),
        label: 'archive',
      ),
    ],
  ),
  children: const [SizedBox(), SizedBox()],
),
```

### Tab Bar
Apps often have different categories of content or features available to users. Naturally,
you want your users to be able to quickly glance at each option and move between categories with a simple swipe.
That’s where the Flutter TabBar class comes in.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/TZRaAZV.gif) | ![Android Dark Mode](https://i.imgur.com/ao7uCRO.gif) |
| ![IOS Light Mode](https://i.imgur.com/pQcHFOo.gif)| ![Android Light Mode](https://i.imgur.com/lx9A8nJ.gif) |

```dart
DefaultTabController(
  length: 2,
  child: AdaptiveTabBar(
    tabs: const [
      AdaptiveTab(label: Text('home'), icon: AdaptiveIcon(AdpIcons.home)),
      AdaptiveTab(label: Text('save'), icon: AdaptiveIcon(AdpIcons.save)),
    ],
  ),
),
```

### Tab Bar Preferred
A specialized version of [AdaptiveTabBar] that implements the [PreferredSizeWidget] interface.
You can use it within an [AdaptiveAppBar] to position the tab bar at the bottom.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/EeNv74B.gif) | ![Android Dark Mode](https://i.imgur.com/SJBHoJR.gif) |
| ![IOS Light Mode](https://i.imgur.com/riEmzJK.gif)| ![Android Light Mode](https://i.imgur.com/ruVA3q9.gif) |

```dart
AdaptiveScaffold(
  appBar: AdaptiveAppBar(
    bottom: AdaptiveTabBarPreferred(
      tabs: const [
        AdaptiveTab(
          label: Text('home'),
          icon: AdaptiveIcon(AdpIcons.home),
        ),
        AdaptiveTab(
          label: Text('save'),
          icon: AdaptiveIcon(AdpIcons.save),
        ),
      ],
    ),
  ),
  body: const Center(),
),
```

### Tab View
The tab view is top-level for your app, facilitates the organization of content into separate tabs,
enabling users to navigate between different sections of the application.
It provides a visually appealing and intuitive way to present and switch between related information.
The Tab View consists of tabs along with their corresponding content, making it easy for users to access specific sections quickly.
This widget is customizable and adaptable, suitable for various application designs and platforms.

```dart
DefaultTabController(
  length: 2,
  child: AdaptiveTabView(
    tabBar: AdaptiveTabBar(
      tabs: const [
        AdaptiveTab(label: Text('home'), icon: AdaptiveIcon(AdpIcons.home)),
        AdaptiveTab(label: Text('save'), icon: AdaptiveIcon(AdpIcons.save)),
      ],
    ),
    children: const [
      Center(child: Text('home')),
      Center(child: Text('save')),
    ],
  ),
),
```

## Pickers

### Date Picker
A date picker is a graphical user interface element that used to select a date from a graphical calendar interface.
It allows users to easily choose a specific date by clicking or tapping on the desired day within the calendar.
Date pickers provide options for navigating between months and years. They are widely used in various applications,
including scheduling, event management, and form submissions, to facilitate the input of dates with accuracy and efficiency.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/clGhRkP.gif) | ![Android Dark Mode](https://i.imgur.com/12RP4oc.gif) |
| ![IOS Light Mode](https://i.imgur.com/5SxxJO7.gif)| ![Android Light Mode](https://i.imgur.com/kIyy2Zq.gif) |

```dart
AdaptiveDatePicker(
  initialDate: DateTime.now(),
  onSelected: (value) {
    print(value.toIso8601String());
  },
),
```

### Time Picker
A time picker is a user interface component that allows users to select a specific time of day, typically in hours and minutes.
It provides a graphical interface for users to adjust the hour and minute values using sliders or input fields.
Time pickers are commonly used in applications that require scheduling or setting reminders, enabling users to choose precise times for events or tasks.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/TtgWXAl.gif) | ![Android Dark Mode](https://i.imgur.com/8KrZHf9.gif) |
| ![IOS Light Mode](https://i.imgur.com/lJSsgfn.gif)| ![Android Light Mode](https://i.imgur.com/YCbFA3g.gif) |

```dart
AdaptiveTimePicker(
  initialTime: TimeOfDay.now(),
  onSelected: (value) {
    print(value.format(context));
  },
),
```

## Surfaces

### Dialog
A dialog is a user interface element that appears on top of the main content to prompt the user for information or to confirm an action.
It typically contains a title, optional content, and one or more action buttons for the user to interact with.
Dialogs are commonly used to display alerts, messages, warnings, or to request input from the user.
They provide a way to temporarily interrupt the user's workflow and require their attention before proceeding.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/doEAsNe.gif) | ![Android Dark Mode](https://i.imgur.com/f49Ekh3.gif) |
| ![IOS Light Mode](https://i.imgur.com/jWhHhlJ.gif)| ![Android Light Mode](https://i.imgur.com/WLmxTUp.gif) |

```dart
AdaptiveButton(
  child: const Text('Show Dialog'),
  onPressed: () {
    showAdpDialog(
      context: context,
      builder: (context) {
        return AdaptiveDialog(
          title: const SizedBox.shrink(),
          content: const SizedBox.shrink(),
          actions: [
            AdaptiveDialogAction(
              child: const Text('Action 1'),
              onPressed: () => Navigator.pop(context),
            ),
            AdaptiveDialogAction(
              child: const Text('Action 2'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  },
),
```

### Bottom Sheet
A bottom sheet is a type of dialog the screen to provide additional information or actions.
It typically contains content that is not essential for the current context but may be useful for the user.
Bottom sheets are commonly used to display menus, settings, or supplementary information without blocking the main content of the application.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/ehol1H1.gif) | ![Android Dark Mode](https://i.imgur.com/ntXC6gm.gif) |
| ![IOS Light Mode](https://i.imgur.com/Fd5g6te.gif)| ![Android Light Mode](https://i.imgur.com/CGDOpbL.gif) |

```dart
AdaptiveButton(
  child: const Text('Show Bottom Sheet'),
  onPressed: () {
    showAdpBottomSheet(
      context: context,
      builder: (context) {
        return const AdaptiveBottomSheet(
          child: Center(child: Text('Hello Word')),
        );
      },
    );
  },
),
```

### List Tile
The list tiles are used to represent a single piece of information, typically within a list or grid layout.
They provide a compact and structured way to display data, often including an icon, title, and additional details.

| IOS Dark\Light Mode                           | Android  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![IOS Dark Mode](https://i.imgur.com/CIBhkp2.gif) | ![Android Dark Mode](https://i.imgur.com/PzqgNRG.gif) |
| ![IOS Light Mode](https://i.imgur.com/eg5qqYf.gif)| ![Android Light Mode](https://i.imgur.com/BLsJ31q.gif) |

```dart
AdaptiveListTile(
  title: Text(DummyText.generateQuestion),
  subtitle: Text(DummyText.generateAnswer),
  trailing: AdaptiveIconButton(
    onPressed: () {},
    icon: const AdaptiveIcon(AdpIcons.ellipsesVert),
  ),
),
```

## Additional

### adaptiveValue
Utilize to execute platform-specific actions.
```dart
AdaptiveButton(
  child: const Text('Do something'),
  onPressed: () {
    final result = adaptiveValue<String>(
      ios: () {
        // Action for iOS platform
        return 'iOS action';
      },
      android: () {
        // Action for Android platform
        return 'Android action';
      },
      web: () {
        // Action for Web platform
        return 'Web action';
      },
    );
    print(result); // This will print the platform-specific action result
  },
),
```

### Adaptive Widget
Widget that provides platform-specific child.
```dart
AdaptiveWidget(
  onIOS: (context) => const Text('Abbas Hussein onIOS'),
  onAndroid: (context) => const Text('Abbas Hussein onAndroid'),
)
```

### Adaptive Builder Widget
Widget that adapts its child's appearance based on the platform.
```dart
AdaptiveBuilderWidget(
  builders: AdaptiveBuilder(
    iOS: (platformChild, theme) {
      return ColoredBox(
        color: theme.canvasColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: platformChild,
        ),
      );
    },
    android: (platformChild, theme) {
      return ColoredBox(
        color: theme.inactiveColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: platformChild,
        ),
      );
    },
  ),
  child: const Text('Abbas Hussein'),
),
```

### Colors
represents the adaptive color value.
```dart
final color = AdpColors.red;
```

### Typography
The text style, it's obtained by accessing the typography settings.
This adjusts the text style based on the current platform.
```dart
final typography = AdaptiveTypography.of(context);
```

### Brightness
To retrieves the brightness mode (light or dark) of the current platform.
It's using this to get the brightness mode.
```dart
final brightness = AdaptiveBrightness.of(context);
```

### Material widgets
You can use these material widgets, which are adaptive for both iOS and Android:

- Tooltip:
   - A tooltip displays informative text when users hover over, focus on, or long-press an element.

- IconTheme:
   - IconTheme is used to set the default properties for icons within its subtree, such as size, color, and opacity.

- Divider:
   - A divider is a horizontal line that separates content in a material design application.

- VerticalDivider:
   - Similar to Divider, but it creates a vertical line instead of a horizontal one.

- LinearProgressIndicator:
  - A linear progress indicator displays progress along a horizontal bar to indicate that a lengthy operation is underway.

- Card:
   - A card is a sheet of material used to represent some related information, such as an album, geographic location, or contact.

- showSearch:
   - showSearch is a function that displays a search page and returns the selected search result.

- MaterialPageRoute:
   - MaterialPageRoute is a type of route that displays its primary contents in the middle of the screen, as a Material-style dialog.
