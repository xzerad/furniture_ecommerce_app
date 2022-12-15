import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/constants.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 260,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5, 5),
            spreadRadius: 0.1,
            blurRadius: 6
          )
        ]
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -120,
              child: SizedBox(
                  width: 140,
                  height: 250,
                  child: Hero(tag: product.tag,
                      child: Image.asset("${product.assets}/0040.png",
                        fit: BoxFit.contain,)))),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                        colors: [
                          kStarGradientColor,
                          kEndGradientColor
                        ]

                    )
                  ),
                  child: const Text("NEW", style: TextStyle(color: Colors.white, fontSize: 13),),
                ),
                const SizedBox(height: 10),
                Text(product.name, style: const TextStyle(color: kPrimaryTextColor, fontWeight: FontWeight.w500),),
                ShaderMask(shaderCallback: (rect){
                  List<Color> colors = List.generate(100, (index) {
                    return (index >= product.rate * 20 )? Colors.white: const Color(0xfff7b365);
                  });
                  return LinearGradient(
                      colors: colors,
                  ).createShader(rect);
                }, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.white, size: 13,)
                  )
                )),
                const SizedBox(height: 15),

                Text(product.brand, style: const TextStyle(color: kPrimaryTextColor, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),

                Text.rich(TextSpan(
                  children: [
                     const WidgetSpan(
                      alignment: PlaceholderAlignment.top,
                      child:  Text("\$", style: TextStyle(fontSize: 8, textBaseline: TextBaseline.alphabetic, color: kMainGrayColor, fontWeight: FontWeight.bold)),
                    ),
                    TextSpan(text: product.price.toString())
                  ], style: const TextStyle(color: kMainGrayColor)
                )),

                const SizedBox(height: 10),

              ],
            ),
          ),
        ],
      ),
    );
  }
}




