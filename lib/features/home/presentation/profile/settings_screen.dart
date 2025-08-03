import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const Text(
            "Preferences",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDarkMode,
            onChanged: (val) {
              setState(() => isDarkMode = val);
              // Save to storage or apply theme
            },
            secondary: const Icon(Icons.dark_mode),
          ),

          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: notificationsEnabled,
            onChanged: (val) {
              setState(() => notificationsEnabled = val);
              // Save to backend or local storage
            },
            secondary: const Icon(Icons.notifications_active),
          ),

          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            subtitle: Text(language),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showLanguageDialog(),
          ),

          const SizedBox(height: 30),
          const Divider(),
          const Text(
            "Support",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("App Info"),
            onTap: () {
              _showAboutDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Privacy Policy"),
            onTap: () {
              // Navigate or open URL
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Language"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ["English", "Nepali", "Hindi"].map((lang) {
            return RadioListTile(
              title: Text(lang),
              value: lang,
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value!;
                  Navigator.pop(context);
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Hostel Sathi',
      applicationVersion: 'v1.0.0',
      applicationIcon: const Icon(Icons.app_settings_alt),
      children: const [
        Text("This app is designed to manage hostels, meals, notices, complaints and more."),
      ],
    );
  }
}
