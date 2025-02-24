import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_flutter/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Cart',
          style: TextStyle(fontSize: 23),
        )),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    // barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Delete Product",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: const Text(
                            'Are You Sure U Want To Remove This Product From Cart'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                )),
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              'Size : ${cartItem['size']}',
            ),
          );
        },
      ),
    );
  }
}
