import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/product/category_filter.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/product/product_card.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/product/search_bar.dart';
import 'package:go_router/go_router.dart';
// class AppColors {
//   static const Color primary = Color(0xFF6C63FF);
//   static const Color background = Color(0xFFF5F7FA);
//   static const Color cardBackground = Colors.white;
//   static const Color textPrimary = Color(0xFF333333);
//   static const Color textSecondary = Color(0xFF757575);
//   static const Color accentGreen = Color(0xFF2ED573);
//   static const Color accentRed = Color(0xFFFF4757);
// }

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<String> _categories = [
    "Semua",
    "Elektronik",
    "Fashion",
    "Makanan",
    "Lainnya"
  ];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        title:
            const Text("Produk", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const ProductSearchBar(),
          CategoryFilters(
            categories: _categories,
            selectedIndex: _selectedCategoryIndex,
            onSelected: (index) {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                GestureDetector(
                  onTap: () => {context.push('/products/1')},
                  child: const ProductCard(
                      id: 1,
                      name: "Laptop Pro",
                      category: "Elektronik",
                      price: "\$1,200",
                      stock: 15,
                      imageUrl:
                          "https://placehold.co/100x100/6C63FF/FFFFFF?text=Laptop"),
                ),
                GestureDetector(
                  onTap: () => {context.push('/products/1')},
                  child: const ProductCard(
                      id: 2,
                      name: "Kaos Katun",
                      category: "Fashion",
                      price: "\$25",
                      stock: 120,
                      imageUrl:
                          "https://placehold.co/100x100/2ED573/FFFFFF?text=Kaos"),
                ),
                GestureDetector(
                  onTap: () => {context.push('/products/1')},
                  child: const ProductCard(
                      id: 3,
                      name: "Kopi Arabika",
                      category: "Makanan",
                      price: "\$15",
                      stock: 80,
                      imageUrl:
                          "https://placehold.co/100x100/FFA502/FFFFFF?text=Kopi"),
                ),
                GestureDetector(
                  onTap: () => {context.push('/products/1')},
                  child: const ProductCard(
                      id: 4,
                      name: "Headphone Bass",
                      category: "Elektronik",
                      price: "\$150",
                      stock: 45,
                      imageUrl:
                          "https://placehold.co/100x100/5352ED/FFFFFF?text=Audio"),
                ),
                GestureDetector(
                  onTap: () => {context.push('/products/1')},
                  child: const ProductCard(
                      id: 5,
                      name: "Sepatu Lari",
                      category: "Fashion",
                      price: "\$80",
                      stock: 75,
                      imageUrl:
                          "https://placehold.co/100x100/FF4757/FFFFFF?text=Sepatu"),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
