import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/global_variable.dart';
import 'package:shopping_app_flutter/widgets/product_card.dart';
import 'package:shopping_app_flutter/pages/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(30),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromARGB(255, 231, 235, 240),
                      side: const BorderSide(
                          color: Color.fromRGBO(255, 231, 235, 240)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 14),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: size.width > 1080
                ? GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                            image: product['imageUrl'] as String,
                            price: product['price'] as double,
                            tittle: product['title'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(173, 216, 230, 0.4)
                                : const Color.fromRGBO(255, 182, 193, 0.4)),
                      );
                    })
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                            image: product['imageUrl'] as String,
                            price: product['price'] as double,
                            tittle: product['title'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(173, 216, 230, 0.4)
                                : const Color.fromRGBO(255, 182, 193, 0.4)),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
