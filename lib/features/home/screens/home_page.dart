import 'package:flutter/material.dart';
import '../widgets/catergory_article.dart';
import '../widgets/carte_riz.dart';
import '../../../core/constants/app_text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Home Page'),
        //backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250, // Increased height for better fill
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Acceill.png'),
                      fit: BoxFit.cover, // Ensures the image covers the area
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
                        const SizedBox(height: 32),
                        Text(
                          'Offrez-vous le meilleur riz.',
                          style: AppTextStyles.heading1.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 58.5,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 208,
                  top: 169,
                  child: Text(
                    'Votre emplacement',
                    style: AppTextStyles.body.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rechercher par catégorie', style: AppTextStyles.heading2),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Tout afficher'),
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
                 //Text('Featured Items', style: AppTextStyles.heading2),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal, // Couleur de l'élément sélectionné
        unselectedItemColor: Colors.grey, // Couleur des icônes non sélectionnées
        showSelectedLabels: true, // Affiche le texte sous l'icône sélectionnée
        showUnselectedLabels: false, // Cache le texte des icônes non sélectionnées
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/your_icon.png')),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Boutique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}