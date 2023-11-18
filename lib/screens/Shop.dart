
import 'package:coffee_shop/components/bottom_nav_bar.dart';
import 'package:coffee_shop/const.dart';
import 'package:coffee_shop/screens/card_page.dart';
import 'package:coffee_shop/screens/shop_page.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _Shop();
}
class _Shop extends State<Shop> {
  // navagate bottom bar
  int _selectedIndex =0;
  void navigateBottomBar(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  //page
  final List<Widget> _pages = [
   //shop page
   ShopPage(),

  
  //cart page
   CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottom(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}