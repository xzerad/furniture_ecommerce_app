import 'package:flutter/material.dart';

import '../constants.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key, required this.header}) : super(key: key);
  final String header;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kPrimaryTextColor
          ),),
        const Icon(Icons.arrow_forward_sharp, size: 18, color: kPrimaryTextColor,)
      ],
    );
  }
}
