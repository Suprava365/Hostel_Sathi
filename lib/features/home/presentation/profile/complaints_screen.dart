import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Complaint {
  final String id;
  final String issueTitle;
  final String issueDescription;
  final String status;
  final String? assignedTo;
  final String createdAt;

  Complaint({
    required this.id,
    required this.issueTitle,
    required this.issueDescription,
    required this.status,
    this.assignedTo,
    required this.createdAt,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['_id'],
      issueTitle: json['issueTitle'] ?? 'Untitled',
      issueDescription: json['issueDescription'] ?? 'No description provided',
      status: json['status'] ?? 'pending',
      assignedTo: json['assignedTo'] is Map
          ? json['assignedTo']['fullname'] ?? null
          : null,
      createdAt: json['createdAt'],
    );
  }
}

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  List<Complaint> complaints = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchComplaints();
  }

  Future<void> fetchComplaints() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/api/complaints'), // Update your API
      );

      if (response.statusCode == 200) {
        final List jsonList = json.decode(response.body)['data'];
        setState(() {
          complaints = jsonList.map((e) => Complaint.fromJson(e)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load complaints');
      }
    } catch (e) {
      print("Error fetching complaints: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  String formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso);
      return "${dt.day}/${dt.month}/${dt.year}";
    } catch (_) {
      return iso;
    }
  }

  Color statusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'in-progress':
        return Colors.blue;
      case 'resolved':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complaints")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : complaints.isEmpty
              ? const Center(child: Text("No complaints found"))
              : ListView.builder(
                  itemCount: complaints.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final complaint = complaints[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              complaint.issueTitle,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Text(complaint.issueDescription),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Chip(
                                  label: Text(complaint.status.toUpperCase()),
                                  backgroundColor:
                                      statusColor(complaint.status).withOpacity(0.1),
                                  labelStyle: TextStyle(
                                    color: statusColor(complaint.status),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                if (complaint.assignedTo != null)
                                  Text(
                                    "Assigned to: ${complaint.assignedTo}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Created on: ${formatDate(complaint.createdAt)}",
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
