import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/data/models/product_model.dart';
import 'package:flutter_simple_arch/router.dart';
import 'package:go_router/go_router.dart';

// --- Dummy Data ---
final List<ProductModel> dummyProducts = [
  ProductModel(
    id: '1',
    name: 'Laptop Pro Generasi Terbaru',
    category: 'Elektronik',
    price: 1200.00,
    imageUrl: 'https://placehold.co/400x400/4A90E2/FFFFFF?text=Laptop+Pro',
    description:
        'Laptop Pro ini ditenagai oleh prosesor terbaru untuk performa maksimal. '
        'Dengan layar Retina yang tajam dan desain yang ramping, laptop ini cocok untuk para profesional dan kreator.',
  ),
  ProductModel(
    id: '2',
    name: 'Smartphone X Ultra',
    category: 'Elektronik',
    price: 899.00,
    imageUrl: 'https://placehold.co/400x400/E74C3C/FFFFFF?text=Phone+X',
    description: 'Smartphone dengan layar AMOLED 120Hz dan kamera 108MP. '
        'Performa tinggi dengan baterai tahan lama, cocok untuk gaming maupun fotografi.',
  ),
];

// --- Product Detail Page ---
class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // Cari produk berdasarkan ID
    final product = dummyProducts.isNotEmpty
        ? dummyProducts.firstWhere(
            (p) => p.id == productId,
            orElse: () => dummyProducts.first,
          )
        : null;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Produk"),
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
        ),
        body: const Center(
          child: Text(
            "Produk tidak ditemukan",
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        title: Text(product.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(product.imageUrl),
            const SizedBox(height: 24),
            _buildProductInfo(product),
            const SizedBox(height: 24),
            _buildDescription(product.description),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stack) {
            return const Center(
              child: Icon(Icons.broken_image, size: 60, color: AppColors.grey),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductInfo(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.category,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Deskripsi",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
