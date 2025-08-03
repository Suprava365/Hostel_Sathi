import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Notice {
  final String id;
  final String title;
  final String message;
  final String postedBy;
  final String createdAt;

  Notice({
    required this.id,
    required this.title,
    required this.message,
    required this.postedBy,
    required this.createdAt,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json['_id'],
      title: json['title'],
      message: json['message'],
      postedBy: json['postedBy'] is Map ? json['postedBy']['fullname'] ?? 'Admin' : 'Admin',
      createdAt: json['createdAt'],
    );
  }
}

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<Notice> notices = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNotices();
  }

  Future<void> fetchNotices() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/api/notices'));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body)['data'];
        setState(() {
          notices = data.map((e) => Notice.fromJson(e)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load notices');
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  String formatDate(String dateTime) {
    final date = DateTime.parse(dateTime);
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notices")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : notices.isEmpty
              ? const Center(child: Text("No notices available"))
              : ListView.builder(
                  itemCount: notices.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final notice = notices[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(notice.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(notice.message),
                            const SizedBox(height: 8),
                            Text("Posted by: ${notice.postedBy}", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            Text("Date: ${formatDate(notice.createdAt)}", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
