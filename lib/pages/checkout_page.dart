import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/components/custom_icon_button.dart';
import 'package:furniture_ecommerce_app/components/gradient_container.dart';
import 'package:furniture_ecommerce_app/components/price_text.dart';
import 'package:furniture_ecommerce_app/components/product_list_tile.dart';
import 'package:furniture_ecommerce_app/constants.dart';


class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: CustomIconButton(child: const Icon(Icons.arrow_back, color: Colors.black54,), onPress: (){
            Navigator.of(context).pop();
          },),
          elevation: 0,
          title: const Text("Cart", style: TextStyle(color: kPrimaryTextColor),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: const [
            CustomIconButton(child:  Icon(Icons.delete_forever_outlined, color: Colors.black54,))
          ],
        ),
        body: const CheckoutBody(),
      ),
    );
  }
}

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height - (80 + 150) ,
          child: ListView.builder(itemBuilder: (context, index){
            return ProductListTile();
          }),
        ),
        SizedBox(
            width: double.infinity,
            height: 150,
            child: ColoredBox(color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Total (3 items) : ", style: TextStyle(color: kMainGrayColor, fontWeight: FontWeight.bold),),
                    PriceText(dollarColor: kMainGrayColor, priceColor: kPrimaryTextColor, price: 1500)
                  ],


                ),
                Container(
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

                      const Text("Proceed to Checkout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 50,),
                      Card(
                          color: Colors.blue.shade300,
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 18,),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}

