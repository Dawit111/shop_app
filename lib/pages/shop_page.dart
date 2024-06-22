import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/my_drawer.dart';
import 'package:shop_app/components/my_product_tile.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
          title: const Text('Shop Page'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<Shop>(context, listen: false)
                      .toggleLighrDarkMode();
                },
                icon: Icon(context.read<Shop>().lightOrDarkicon)),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cartPage'),
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            const SizedBox(height: 25),

            // shop sub title
            Center(
                child: Text(
              'Pick from a selected list of premium products',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),

            // product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(15),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    //  get each individual product from shop
                    final product = products[index];
                    // return as a product tile UI
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
