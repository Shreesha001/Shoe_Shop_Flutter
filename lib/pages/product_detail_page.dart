import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_flutter/providers/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product Added Successfully"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Select A Size"),
        ),
      );
    }
  }

  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Image.asset(height: 250, widget.product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Color.fromARGB(192, 230, 227, 227),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedSize == size
                                ? const Color.fromARGB(255, 117, 214, 255)
                                : null,
                            label: Text(size.toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(350, 50),
                      ),
                      child: const Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
