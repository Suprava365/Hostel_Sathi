import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InventoryItem {
  final String id;
  final String itemName;
  final int quantity;
  final String status;
  final String? assignedRoom;
  final String? notes;
  final String createdAt;

  InventoryItem({
    required this.id,
    required this.itemName,
    required this.quantity,
    required this.status,
    this.assignedRoom,
    this.notes,
    required this.createdAt,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['_id'],
      itemName: json['itemName'] ?? 'Unnamed Item',
      quantity: json['quantity'] ?? 0,
      status: json['status'] ?? 'available',
      assignedRoom: json['assignedRoom'] is Map
          ? json['assignedRoom']['roomNumber'] ?? null
          : null,
      notes: json['notes'],
      createdAt: json['createdAt'],
    );
  }
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<InventoryItem> inventory = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchInventory();
  }

  Future<void> fetchInventory() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/api/inventory'), // Replace with your API
      );

      if (response.statusCode == 200) {
        final List jsonList = json.decode(response.body)['data'];
        setState(() {
          inventory = jsonList.map((e) => InventoryItem.fromJson(e)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load inventory');
      }
    } catch (e) {
      print("Error fetching inventory: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'available':
        return Colors.green;
      case 'assigned':
        return Colors.blue;
      case 'damaged':
        return Colors.orange;
      case 'lost':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw);
      return "${dt.day}/${dt.month}/${dt.year}";
    } catch (_) {
      return raw;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inventory")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : inventory.isEmpty
              ? const Center(child: Text("No inventory items found"))
              : ListView.builder(
                  itemCount: inventory.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final item = inventory[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.itemName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 6),
                            Text("Quantity: ${item.quantity}"),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Chip(
                                  label: Text(item.status.toUpperCase()),
                                  backgroundColor:
                                      getStatusColor(item.status).withOpacity(0.1),
                                  labelStyle: TextStyle(
                                      color: getStatusColor(item.status),
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                if (item.assignedRoom != null)
                                  Text(
                                    "Room: ${item.assignedRoom}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                              ],
                            ),
                            if (item.notes != null && item.notes!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("Notes: ${item.notes!}"),
                              ),
                            Text(
                              "Added: ${formatDate(item.createdAt)}",
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
