import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String tittle;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCard(
      {super.key,
      required this.image,
      required this.price,
      required this.tittle,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tittle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset(
              image,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
