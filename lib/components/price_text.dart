import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  const PriceText({Key? key, required this.dollarColor, required this.priceColor, required this.price}) : super(key: key);
  final double price;
  final Color dollarColor;
  final Color priceColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child:  Text("\$", style: TextStyle(fontSize: 8,
                textBaseline: TextBaseline.alphabetic,
                color: dollarColor, fontWeight: FontWeight.bold)),
          ),
          TextSpan(text: price.toString())
        ], style: TextStyle(color: priceColor, fontWeight: FontWeight.bold)
    ));
  }
}
