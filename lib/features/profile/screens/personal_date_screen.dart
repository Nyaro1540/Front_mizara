import 'package:flutter/material.dart';

class PersonalDateScreen extends StatelessWidget {
  const PersonalDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar iOS style
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_4_bar, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 16),
                    ],
                  ),
                ],
              ),
            ),

            // Header with back button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      'Personal Date',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 48), // Pour équilibrer le header
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Image
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Personal%20Date.jpg-6zqeYM5CPyGwlp2S2Lb2B4mSAyseqX.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),

                      // Form Fields
                      _buildFormField('Full Name', 'Albert Stevano Bajefski'),
                      _buildFormField('Date of birth', '19/06/1999'),
                      _buildDropdownField('Gender', 'Male'),
                      _buildFormField('Phone', '+1 325-433-7656'),
                      _buildFormField('Email', 'albertstevano@gmail.com'),
                      
                      SizedBox(height: 32),

                      // Save Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Home Indicator
            Container(
              height: 24,
              alignment: Alignment.center,
              child: Container(
                width: 120,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.orange),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdownField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: DropdownButtonFormField<String>(
            value: initialValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            items: ['Male', 'Female', 'Other']
                .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList(),
            onChanged: (_) {},
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}