
import 'package:adp_mobile/adp_mobile.dart';

class DisplayNavButton extends StatelessWidget {
  const DisplayNavButton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(horizontal: 20.0);

    return Padding(
      padding: edgeInsets,
      child: SizedBox(
        width: double.infinity,
        child: AdaptiveButton(
          child: const Text('display'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => child,
              ),
            );
          },
        ),
      ),
    );
  }
}
