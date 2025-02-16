import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            CustomScrollView(
              slivers: [
                // App Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child:
                                const Icon(Icons.arrow_back_ios_new, size: 20),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            'Payment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 40), // Pour équilibrer le titre
                      ],
                    ),
                  ),
                ),

                // Content
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const Text(
                        'You deserve better meal',
                        style: TextStyle(
                          color: Color(0xFF878787),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Item Ordered Section
                      const Text(
                        'Item Ordered',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Mizara_partie_client-Zjhe00mroHZABGhuPniN2vxyblmN0u.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Burger With Meat',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '\$ 12,230',
                                  style: TextStyle(
                                    color: const Color(0xFF319795),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            '14 items',
                            style: TextStyle(
                              color: Color(0xFF878787),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Details Transaction Section
                      const Text(
                        'Details Transaction',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow('Cherry Healthy', '\$ 180.000'),
                      _buildDetailRow('Driver', '\$ 50.000'),
                      _buildDetailRow('Tax 10%', '\$ 80.390'),
                      _buildDetailRow(
                        'Total Price',
                        '\$ 100.000',
                        valueColor: const Color(0xFF319795),
                      ),
                      const SizedBox(height: 32),

                      // Deliver to Section
                      const Text(
                        'Deliver to:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow('Name', 'Albert Stevano'),
                      _buildDetailRow('Phone No.', '+12 8347 2838 28'),
                      _buildDetailRow('Address', 'New York'),
                      _buildDetailRow('House No.', 'BC54 Berlin'),
                      _buildDetailRow('City', 'New York City'),
                      const SizedBox(height: 100), // Espace pour le bouton
                    ]),
                  ),
                ),
              ],
            ),

            // Bottom Button
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF319795),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Chackout Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF878787),
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
