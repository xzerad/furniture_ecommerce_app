import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/components/custom_header.dart';
import 'package:furniture_ecommerce_app/components/custom_icon_button.dart';
import 'package:furniture_ecommerce_app/components/product_card.dart';
import 'package:furniture_ecommerce_app/constants.dart';
import 'package:furniture_ecommerce_app/pages/checkout_page.dart';
import 'package:furniture_ecommerce_app/pages/product_details_page.dart';
import 'package:furniture_ecommerce_app/products.dart';
import 'package:furniture_ecommerce_app/models/product.dart';
import 'package:furniture_ecommerce_app/components/gradient_container.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const CustomIconButton(child: Icon(Icons.menu, color: Colors.black54,),),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions:  [
            CustomIconButton(
                onPress: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const CheckoutPage()));
                },
                child: const Icon(Icons.shopping_bag_rounded, color: Colors.black54, size: 20,))
          ],
        ),
        body: const HomeBody(),
        bottomNavigationBar: StatefulBuilder(
          builder: (context, setState) {
            return BottomNavigationBar(items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.notifications ), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: ""),
            ], selectedItemColor: kStarGradientColor,
              iconSize: 30,
              unselectedItemColor: kMainGrayColor,
              currentIndex: currentIndex,
              onTap: (index)=>setState(()=>currentIndex = index),
            );
          }
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const CustomHeader(header: "New arrival",),
          Container(
            padding: const EdgeInsets.only(top: 15),
            width: double.infinity,
            height: 260,
            child: ScrollConfiguration(

              behavior: NoScrollIndicator(),
              child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    Product product = products[index];
                    return  GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ProductDetails(product: product,)));
                        },
                        child: ProductCard(product: product));
                }),
            ),
          ),
          const SizedBox(height: 5,),
          const CustomHeader(header: "Collections",),
          const SizedBox(height: 5,),

        ],
      ),
    );
  }
}

class NoScrollIndicator extends ScrollBehavior{


  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
