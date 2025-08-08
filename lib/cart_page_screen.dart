import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Cart_Provider.dart';


class cartPageScreen extends StatelessWidget {
  const cartPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<cartProvider>().cart;
    return Scaffold(
      appBar: AppBar(title: Text("cart")),
      body: cart.isEmpty
          ? Center(
              child: Text(
                "First Add Something",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final cartProduct = cart[index];

                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          cartProduct['imageUrl'].toString(),
                        ),
                      ),
                      title: Text(
                        cartProduct['title'].toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      subtitle: Text(cartProduct['sizes'].toString()),
                      trailing: GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Remove Product from Cart",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<cartProvider>().removeProduct(cartProduct,);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                    );

                },
              ),
            ),
    );
  }
}
