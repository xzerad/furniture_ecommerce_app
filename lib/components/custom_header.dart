import 'package:flutter/material.dart';

import '../constants.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text("New arrival",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kPrimaryTextColor
          ),),
        Icon(Icons.arrow_forward_sharp, size: 18, color: kPrimaryTextColor,)
      ],
    );
  }
}
