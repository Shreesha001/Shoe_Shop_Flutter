import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/pages/cart_page.dart';

import 'package:shopping_app_flutter/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 30,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: '')
          ]),
    );
  }
}
