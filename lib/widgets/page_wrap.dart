import 'package:flutter/material.dart';

class PageWrap extends StatelessWidget {
  final Widget child;
  PageWrap({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: this.child,
    );
  }
}
