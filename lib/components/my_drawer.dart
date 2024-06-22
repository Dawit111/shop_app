import 'package:flutter/material.dart';
import 'package:shop_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header : logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // shop tile
              MyListTile(
                icon: Icons.home,
                title: "Shop",
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              MyListTile(
                icon: Icons.shopping_cart,
                title: "Cart",
                onTap: () {
                  // pop the drawer first
                  Navigator.pop(context);

                  // go to cart page
                  Navigator.pushNamed(context, '/cartPage');
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              title: "Exit",
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/landingPage', (route) => false);
              },
            ),
          ),

          // cart tile

          // exit shop tile
        ],
      ),
    );
  }
}
