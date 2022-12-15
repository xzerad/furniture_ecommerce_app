import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/components/price_text.dart';
import 'package:furniture_ecommerce_app/constants.dart';

class ProductListTile extends StatelessWidget {
   ProductListTile({Key? key}) : super(key: key);

  int productCountPurchase = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(3, 3),
            spreadRadius: 2,
            blurRadius: 10
          )
        ]
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xfff8f9fc),
                    Color(0xffecedf2)
                  ]
                )
              ),
              width: 150,
              child: Image.asset("./assets/cube/0040.png"),
            ),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 1,),

              const Text("Minimalist Chair", style: TextStyle(color: kPrimaryTextColor, fontWeight: FontWeight.bold, fontSize: 17),),
              const Text("Dark Gray", style: TextStyle(color: kMainGrayColor, fontSize: 13, fontWeight: FontWeight.bold ),),
              const SizedBox(height: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const PriceText(dollarColor: kMainGrayColor, priceColor: kPrimaryTextColor, price: 500,),
                  Container(
                     padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xfff8f9fc),
                            Color(0xffecedf2)
                          ]

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))

                    ),
                    width: 90,
                    height: 35,
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
                                    child: Icon(Icons.remove, size: 20, color: kIconPrimaryColor,),
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
                                    child: Icon(Icons.add, size: 20, color: kIconPrimaryColor,),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                    ),
                  )
                ],
              ),
              const SizedBox(height: 1,),

            ],
          ))
        ],
      ),
    );
  }
}
