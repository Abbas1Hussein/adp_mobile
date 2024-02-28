import 'package:adp_mobile/adp_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const themeMode = ThemeMode.light;

void main() async {
  DefaultsPlatformManager.initialize(
    targetPlatform: MobileTargetPlatform.android,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdpApp(
      themeMode: themeMode,
      home: adaptiveValue(
        ios: () => const CupertinoPageScaffold(child: HomeScreen()),
        android: () => const Scaffold(body: HomeScreen()),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _formData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdaptiveTextFormField(
              prefix: const AdaptiveIcon(AdpIcons.search),
              placeholder: 'Enter text...',
              onSaved: (newValue) {
                _formData = newValue;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            AdaptiveButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                 print('Form submitted: $_formData');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}