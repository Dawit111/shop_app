import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/my_button.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    // show alert dialog for the user to confirm to remove cart
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text('Sure to remove this item ?'),
            actions: [
              // cancel button
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),

              // yes button
              MaterialButton(
                  child: const Text('yes'),
                  onPressed: () {
                    // pop dialog box
                    Navigator.pop(context);

                    // add item to the cart
                    context.read<Shop>().removeFromItem(product);
                  })
            ],
          );
        });
  }

  // user pressed pat button

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(
                'user wants to pay! connect this app to your payment backend.'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // get access to cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: cart.isEmpty
                  ? Center(child: Text('Your cart is empty...'))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get individual cart item
                        final item = cart[index];

                        // pass to cart UI
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                              icon: const Icon(Icons.remove)),
                        );
                      })),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
                child: const Text('PAY NOW'),
                onTap: () => payButtonPressed(context)),
          )
        ],
      ),
    );
  }
}
