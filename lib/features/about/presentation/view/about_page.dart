import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('About Us'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 20),
              Center(
                child: Icon(
                  Icons.apartment,
                  size: 80,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Hostel/PG Management System",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome to the Hostel/PG Management System. Our application helps manage hostels and PGs efficiently with features like room booking, user management, payments, and more.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                "Features:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("• Search and Book Hostels/PGs"),
              Text("• Check Room Availability"),
              Text("• View Amenities like WiFi, Parking, Cafeteria"),
              Text("• Profile Management"),
              Text("• Submit Feedback and Report Issues"),
              SizedBox(height: 20),
              Text(
                "Our Mission",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We aim to simplify the accommodation process for students and working professionals by connecting them with reliable and well-managed hostels/PGs.",
              ),
              SizedBox(height: 20),
              Text(
                "Contact Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Email: support@hostelpg.com"),
              Text("Phone: +91 9876543210"),
              SizedBox(height: 40),
              Center(
                child: Text(
                  "© 2025 HostelPG Inc. All rights reserved.",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
