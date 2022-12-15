import 'package:flutter/material.dart';


class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xfffbfbfd),
                Color(0xfffbfbfd),
                Color(0xfffbfbfd),

                Color(0xffeaecf2)
              ]
          )
      ),
      child: child,
    );
  }
}
