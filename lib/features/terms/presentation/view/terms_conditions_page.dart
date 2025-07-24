import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Terms & Conditions'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 10),
              Text(
                "Terms & Conditions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome to the Hostel/PG Management System. By using this application, you agree to the following terms and conditions:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                "1. User Responsibilities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Users must provide accurate details while registering and booking. Any misuse of the platform will lead to account suspension.",
              ),
              SizedBox(height: 15),
              Text(
                "2. Booking & Payments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "All bookings made are subject to availability and confirmation by hostel management. Payments are non-refundable once confirmed.",
              ),
              SizedBox(height: 15),
              Text(
                "3. Liability",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "We are not responsible for any loss or damage to personal property during the stay.",
              ),
              SizedBox(height: 15),
              Text(
                "4. Amendments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "These terms and conditions can be updated without prior notice. Users are advised to review them periodically.",
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Last updated: January 2025",
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
