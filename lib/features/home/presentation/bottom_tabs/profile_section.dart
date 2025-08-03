import 'package:flutter/material.dart';
import 'package:hostel_sathi/features/home/presentation/profile/complaints_screen.dart';
import 'package:hostel_sathi/features/home/presentation/profile/inventory_screen.dart';
import 'package:hostel_sathi/features/home/presentation/profile/meals_screen.dart';
import 'package:hostel_sathi/features/home/presentation/profile/notice_screen.dart';
import 'package:hostel_sathi/features/home/presentation/profile/settings_screen.dart';

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
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "John Doe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text("johndoe@example.com", style: TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 30),
          const Divider(),

          // Management Sections
          _buildProfileItem(Icons.people, "User Management", () {}),
          _buildProfileItem(Icons.house, "Hostel Management", () {}),
          _buildProfileItem(Icons.payments, "Payments", () {}),
          _buildProfileItem(Icons.restaurant_menu, "Meals", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MealsScreen()),
            );
          }),
          _buildProfileItem(Icons.report_problem, "Complaints", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ComplaintsScreen()),
            );
          }),
          _buildProfileItem(Icons.notifications_active, "Notices", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NoticeScreen()),
            );
          }),
          _buildProfileItem(Icons.inventory_2, "Inventory", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const InventoryScreen()),
            );
          }),
          _buildProfileItem(Icons.settings, "Settings", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingScreen()),
            );
          }),

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

  static Widget _buildProfileItem(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
