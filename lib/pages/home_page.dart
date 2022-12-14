import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/components/custom_header.dart';
import 'package:furniture_ecommerce_app/components/custom_icon_button.dart';
import 'package:furniture_ecommerce_app/components/product_card.dart';
import 'package:furniture_ecommerce_app/pages/product_details_page.dart';
import 'package:furniture_ecommerce_app/products.dart';

import '../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomIconButton(child: Icon(Icons.menu, color: Colors.black54,),),
        elevation: 0,
        backgroundColor: const Color(0xfffcfcff),
        actions: const [
          CustomIconButton(child: Icon(Icons.shopping_bag_rounded, color: Colors.black54, size: 20,))
        ],
      ),
      body: const HomeBody(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: ""),

      ],),
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
          const CustomHeader(),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
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
          )
        ],
      ),
    );
  }
}
