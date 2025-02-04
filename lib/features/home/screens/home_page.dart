import 'package:flutter/material.dart';
import '../widgets/catergory_article.dart';
import '../widgets/carte_riz.dart';
import '../../../core/constants/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Mizara_partie_client-LqmICZMyHzhVzw2EF2f1hgTegJEIyH.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.4),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Get the best food delivered',
                      style: AppTextStyles.heading1.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Order your favorite meals right to your doorstep',
                      style: AppTextStyles.body.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Categories', style: AppTextStyles.heading2),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See all'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CategoryItem(
                          icon: Icons.fastfood,
                          label: 'Fast Food',
                        ),
                        CategoryItem(
                          icon: Icons.local_cafe,
                          label: 'Drinks',
                        ),
                        CategoryItem(
                          icon: Icons.icecream,
                          label: 'Desserts',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Featured Items
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Featured Items', style: AppTextStyles.heading2),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                    children: const [
                      FoodItemCard(
                        name: 'Burger With Meat',
                        price: '\$8.99',
                        rating: 4.5,
                        imageUrl: 'placeholder_url',
                      ),
                      FoodItemCard(
                        name: 'Special Pizza',
                        price: '\$12.99',
                        rating: 4.8,
                        imageUrl: 'placeholder_url',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}