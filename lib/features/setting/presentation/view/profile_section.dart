import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          // Profile Avatar
          Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "John Doe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "johndoe@example.com",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 30),
          const Divider(),

          // Profile options
          _buildProfileItem(Icons.person, "Account Settings", () {}),
          _buildProfileItem(Icons.info_outline, "About Us", () {}),
          _buildProfileItem(Icons.description, "Terms and Conditions", () {}),
          _buildProfileItem(Icons.lock_outline, "Privacy Policy", () {}),
          _buildProfileItem(Icons.report_problem, "Issues", () {}),
          _buildProfileItem(Icons.feedback_outlined, "Feedback", () {}),

          const Divider(),

          // Logout Button
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text("Logout", style: TextStyle(color: Colors.white)),
            onPressed: () {
              // Logout logic here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
