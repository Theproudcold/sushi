import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    void removeFromCart(Food food) {
      // get access to shop
      final shop = context.read<Shop>();
      // remove from cart
      shop.removeFromCart(food);
    }
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                foregroundColor: Colors.white,
                title: const Text("My cart"),
                backgroundColor: primaryColor,
                elevation: 0,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        // get food from cart
                        final Food food = value.cart[index];
                        // get food name
                        final String foodName = food.name;
                        // get food price
                        final String foodPrice = food.price;
                        // return list title
                        return Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: ListTile(
                            title: Text(
                              foodName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(foodPrice,
                                style: TextStyle(color: Colors.grey[200])),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.grey[300],
                              ),
                              onPressed: () => removeFromCart(food),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // pay button
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: MyButton(
                      text: "Pay Now",
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ));
  }
}
