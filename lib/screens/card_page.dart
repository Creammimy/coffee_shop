import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffee_tile.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';
import 'success_page.dart';  // Import SuccessPage

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItemFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  void payNow(BuildContext context) {
    // Implement your payment logic here

    // Navigate to SuccessPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SuccessPage()),
    );
  }
  


  @override
  Widget build(BuildContext context) {
    CoffeeShop coffeeShop = Provider.of<CoffeeShop>(context);
    double totalPrice = coffeeShop.calculateTotalPrice();

    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text('Your Cart', style: TextStyle(fontSize: 20)),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.userCart[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeItemFromCart(eachCoffee),
                      icon: Icon(Icons.delete),
                    );
                  },
                ),
              ),
              if (value.userCart.isNotEmpty)
                Column(
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Total Price: ${totalPrice.toStringAsFixed(2)} ฿',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => payNow(context),
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Pay Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
