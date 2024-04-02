import 'package:flutter/material.dart';

typedef TabBuilder = Widget Function(TabController controller, int index);

class ControllerTabBuilder extends StatefulWidget {
  const ControllerTabBuilder(
      {super.key, this.controller, required this.builder});

  final TabBuilder builder;
  final TabController? controller;

  @override
  State<ControllerTabBuilder> createState() => _ControllerTabBuilderState();
}

class _ControllerTabBuilderState extends State<ControllerTabBuilder> {
  TabController? _controller;
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabController();
  }

  @override
  void didUpdateWidget(ControllerTabBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
    }
  }

  void _updateTabController() {
    _controller = widget.controller ?? DefaultTabController.of(context);
    _controller?.addListener(_handleTabControllerTick);
    _currentIndex = _controller?.index ?? 0;
  }

  void _handleTabControllerTick() {
    if (_controller!.index != _currentIndex) {
      _currentIndex = _controller!.index;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_controller!, _currentIndex);
  }

  @override
  void dispose() {
    _controller?.removeListener(_handleTabControllerTick);
    _controller = null;
    super.dispose();
  }
}
