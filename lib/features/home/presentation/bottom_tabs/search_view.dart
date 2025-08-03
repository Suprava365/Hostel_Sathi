import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Hostel/PG'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by location, name or feature',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune), // replaced LucideIcons.filter
                  onPressed: () {
                    // Open filter modal or bottom sheet
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Placeholder for search results
            Expanded(
              child: Center(
                child: Text(
                  'Search results will appear here',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
