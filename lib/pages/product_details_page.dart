import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/components/custom_icon_button.dart';
import 'package:furniture_ecommerce_app/constants.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

import '../models/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomIconButton(child: const Icon(Icons.arrow_back, color: Colors.black54,), onPress: (){
          Navigator.of(context).pop();
        },),
        actions: const [
          CustomIconButton(child: Icon(Icons.shopping_bag_rounded, color: Colors.black54, size: 20,))
        ],
      ),
      body: ProductDetailsBody(product: product),
    );
  }
}

class ProductDetailsBody extends StatefulWidget {
   const ProductDetailsBody({Key? key,required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
   ImageSequenceAnimatorState? offlineImageSequenceAnimator;
   late Product product ;
   int productCountPurchase = 1;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        width: size.width,
                        height: 250,
                        // color: const Color(0xfffafbfd),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xfffdfdfe),
                              Color(0xfff5f6fb)
                            ]
                          )
                        ),
                        child: Hero(tag: product.tag,
                            child:  ImageSequenceAnimator(
                                      product.assets,
                                      "",
                                      1,
                                      4,
                                      "png",
                                      80,
                                      fps: 30,
                              isAutoPlay: false,

                              onReadyToPlay: (animator){
                                        offlineImageSequenceAnimator = animator;
                              },
                              onPlaying: (animator){
                              },
                            )
                        )),
                    Positioned(
                      bottom: -70,
                      left: size.width/6,
                      child: CustomCurvedSlider(
                          width: size.width,
                          onChange: (x){
                        var progress = (math.pow(x + 115, 2) / math.pow(225, 2))*80;
                        offlineImageSequenceAnimator?.skip(progress);
                      }),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(product.name, style: const TextStyle(color: kPrimaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),)),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: const Color(0xfff5f6fc),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onTap: (){
                                            if(productCountPurchase > 1){
                                              setState((){
                                                productCountPurchase -= 1;
                                              });
                                            }
                                          },
                                          child: const Card(
                                            elevation: 2,
                                            child: Icon(Icons.remove, size: 17, color: kIconPrimaryColor,),
                                          ),
                                        ),
                                      ),
                                       Expanded(
                                          flex: 5,
                                          child: Text("$productCountPurchase", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold),)),
                                      Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onTap: (){
                                            setState((){
                                              productCountPurchase += 1;
                                            });
                                          },
                                          child: const Card(
                                            elevation: 2,
                                            child: Icon(Icons.add, size: 17, color: kIconPrimaryColor,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Text("Description", style: TextStyle(color: kPrimaryTextColor, fontWeight: FontWeight.w500),),
                      const SizedBox(height: 5,),

                      Text(product.description, style: const TextStyle(color: kMainGrayColor),),
                      const SizedBox(height: 50,),

                    ],
                  ),
                )


              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                    colors: [
                      kStarGradientColor,
                      kEndGradientColor
                    ]
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                    color: Colors.blue.shade200,
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 18,),
                    )), 
                const Text("Add to cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                CustomPaint(
                  painter: PipePainter(),
                ),
                const SizedBox(width: 1,),
                Text.rich(TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child:  Text("\$", style: TextStyle(fontSize: 8, textBaseline: TextBaseline.alphabetic, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      TextSpan(text: product.price.toString())
                    ], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                )),
                const SizedBox(width: 1,),

              ],
            ),
          ),
        )
      ],
    );
  }
}

class PipePainter  extends CustomPainter{
  @override
  void paint(ui.Canvas canvas, ui.Size size) {
      var dx = size.width/2;
      canvas.drawLine(Offset(dx, 12), Offset(dx, size.height - 12), Paint()..color = Colors.white);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SlidePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTWH(0, 0, 250, 60);
    const startAngle = math.pi ;
    const sweepAngle = -math.pi;
    const useCenter = false;
    final paint = Paint()
      ..shader = ui.Gradient.linear(rect.topLeft, rect.topRight, [
        Colors.white,
        Colors.blue.shade300,
        Colors.blue,
        Colors.blue.shade300,
        Colors.white,

      ], [
        0, 0.1, 0.5, .9, 1
      ])
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}

class CustomCurvedSlider extends StatefulWidget {
  const CustomCurvedSlider({Key? key, required this.onChange, required this.width}) : super(key: key);
  final double width;
  final Function(double) onChange;

  @override
  State<CustomCurvedSlider> createState() => _CustomCurvedSliderState();
}

class _CustomCurvedSliderState extends State<CustomCurvedSlider> {
  double x = 0, y = 0;

  double iconSize = 25;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: widget.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            painter: SlidePainter(),
          ),
          Positioned(
              top: -iconSize/2 + 60 + y,
              left: -iconSize/2 + x + 125,
              child: GestureDetector(
                  onPanUpdate: (v){

                    var dx = x + v.delta.dx;
                    var dy = math.sqrt((1 - math.pow(dx, 2)/math.pow(125, 2)) * math.pow(30, 2));
                    if(! dy.isNaN && ! dx.isNaN) {
                      widget.onChange(x);
                      setState(() {
                        x = dx;
                        y = -30 + dy;
                      });

                    }

                  },
                  child: Container(
                      height: iconSize,
                      width: iconSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(1, 1),
                            blurRadius: 3
                          ),
                          
                        ]
                      ),
                      child: Icon(Icons.circle_outlined, color: Colors.blue, size: iconSize - 12,)))),

        ],
      ),
    );
  }
}




