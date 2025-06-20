import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Calender"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: "Trending"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Greeting and Profile Picture
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Text.rich(
                        TextSpan(
                          text: 'Hi Suprava,\n',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                          children: [
                            TextSpan(
                              text: 'Good AfterNoon',
                              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/user.png'), // replace with your image
                    )
                  ],
                ),

                const SizedBox(height: 12),
                const Divider(),

                const SizedBox(height: 12),
                const Text(
                  "What Are We Looking For Today?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),

                /// Filter Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      /// Seater
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Seater", style: TextStyle(fontSize: 12)),
                            DropdownButton<String>(
                              isExpanded: true,
                              value: '3',
                              underline: Container(),
                              items: ['1', '2', '3', '4']
                                  .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// Location
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Location", style: TextStyle(fontSize: 12)),
                            SizedBox(height: 4),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Ghattkulo",
                                border: OutlineInputBorder(),
                                isDense: true,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// Price
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Price Range", style: TextStyle(fontSize: 12)),
                            SizedBox(height: 4),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "5500 - 9000",
                                border: OutlineInputBorder(),
                                isDense: true,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.deepOrange,
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                /// Top Hostel Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Top Hostel Near Your Area",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("See All", style: TextStyle(color: Colors.blue)),
                  ],
                ),

                const SizedBox(height: 16),

                /// Grid View for Hostels
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            child: Image.asset(
                              'assets/hostel.jpg', // Replace with your image
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Amity Girls Hostel",
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text("🚻 Girls Only  🪑 2 Seater", style: TextStyle(fontSize: 12)),
                                Text("📶 WiFi  🔐 Lockable Room", style: TextStyle(fontSize: 12)),
                                Text("🚿 Hot Water  🔇 Quiet Place", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
