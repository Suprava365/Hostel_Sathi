import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealPlan {
  final String date;
  final String breakfast;
  final String lunch;
  final String dinner;

  MealPlan({
    required this.date,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    return MealPlan(
      date: json['date'] ?? '',
      breakfast: json['breakfast'] ?? 'Not available',
      lunch: json['lunch'] ?? 'Not available',
      dinner: json['dinner'] ?? 'Not available',
    );
  }
}

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<MealPlan> meals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://localhost:3000/api/meals',
        ), // Update to your actual API
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body)['data'];
        setState(() {
          meals = jsonData.map((e) => MealPlan.fromJson(e)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      print("Error fetching meals: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  String formatDate(String rawDate) {
    try {
      final date = DateTime.parse(rawDate);
      return "${date.day}/${date.month}/${date.year}";
    } catch (_) {
      return rawDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meal Plan")),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : meals.isEmpty
              ? const Center(child: Text("No meal plans available"))
              : ListView.builder(
                itemCount: meals.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date: ${formatDate(meal.date)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text("🍳 Breakfast: ${meal.breakfast}"),
                          Text("🥘 Lunch: ${meal.lunch}"),
                          Text("🍽️ Dinner: ${meal.dinner}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
