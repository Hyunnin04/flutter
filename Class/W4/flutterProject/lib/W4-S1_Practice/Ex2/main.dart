import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 34, 133, 255),
        appBar: AppBar(
          title: const Text("Products"),
          backgroundColor: const Color.fromARGB(255, 249, 243, 250),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              ProductCard(product: products[0]),
              const SizedBox(height: 10),
              ProductCard(product: products[1]),
              const SizedBox(height: 10),
              ProductCard(product: products[2]),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String image;
  final String title;
  final String description;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

const List<Product> products = [
  Product(
    image: 'assets/Image/dart.png',
    title: 'Dart',
    description: 'the best object language',
  ),
  Product(
    image: 'assets/Image/flutter.png',
    title: 'Flutter',
    description: 'the best mobile widget library',
  ),
  Product(
    image: 'assets/Image/firebase.png',
    title: 'Firebase',
    description: 'the best cloud database',
  ),
];

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      height: 150,            
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20), 
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 15),
            Image.asset(
              product.image, 
              width: 60,     
              height: 60,    
            ),
            const SizedBox(width: 20), 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
