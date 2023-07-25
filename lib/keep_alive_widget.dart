import 'package:flutter/material.dart';

class KeepAliveWidget extends StatefulWidget {
  final Widget widget;
  const KeepAliveWidget({
    super.key,
    required this.widget,
  });

  @override
  State<KeepAliveWidget> createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget;
  }
}
