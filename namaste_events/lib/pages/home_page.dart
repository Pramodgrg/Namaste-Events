import 'package:flutter/material.dart';
import 'package:namaste_events/components/category_tile.dart';
import 'package:namaste_events/components/item_tile.dart';
import 'package:namaste_events/components/bottom_nav_bar.dart';
import 'package:namaste_events/pages/Hompage/catering_page.dart';
import 'package:namaste_events/pages/Hompage/photographer_page.dart';
import 'package:namaste_events/pages/Hompage/venue_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Namaste Events'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Featured Categories
            _buildSectionHeader(context, "Featured", const VenuePage()),
            SizedBox(
              height: 120, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryTile(
                    title: "Wedding Venues",
                    image: "assets/background.jpg",
                    onTap: () => _navigateTo(context, const VenuePage()),
                  ),
                  const SizedBox(width: 10),
                  CategoryTile(
                    title: "Wedding Photographer",
                    image: "assets/background.jpg",
                    onTap: () => _navigateTo(context, const PhotographerPage()),
                  ),
                  const SizedBox(width: 10),
                  CategoryTile(
                    title: "Catering Services",
                    image: "assets/background.jpg",
                    onTap: () => _navigateTo(context, const CateringPage()),
                  ),
                  const SizedBox(width: 10),
                  CategoryTile(
                    title: "Wedding Photographer",
                    image: "assets/background.jpg",
                    onTap: () => _navigateTo(context, const PhotographerPage()),
                  ),
                  const SizedBox(width: 10),
                  CategoryTile(
                    title: "Catering Services",
                    image: "assets/background.jpg",
                    onTap: () => _navigateTo(context, const CateringPage()),
                  ),
                  const SizedBox(width: 10),
                  CategoryTile(
                    title: "Wedding Photographer",
                    image: "assets/background.jpg",
                    onTap: () => _navigateTo(context, const PhotographerPage()),
                  ),
                  const SizedBox(width: 10),
                  CategoryTile(
                    title: "Catering Services",
                    image: "assets/background.jpg",
                    onTap: () => _navigateTo(context, const CateringPage()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Venues Section
            _buildSectionHeader(
                context, "Venues in Your City", const VenuePage()),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ItemTile(
                    title: "Pokhara Kantipur",
                    location: "Buddha Chowk",
                    price: "Rs 980/plate",
                    image: "assets/background.jpg",
                    onTap: () {},
                  ),
                  const SizedBox(width: 10), // Add spacing between tiles
                  ItemTile(
                    title: "Namaste Party",
                    location: "Lekhnath",
                    price: "Rs 1000/plate",
                    image: "assets/background.jpg",
                    onTap: () {},
                  ),
                  const SizedBox(width: 10), // Add spacing between tiles
                  ItemTile(
                    title: "Namaste Party",
                    location: "Lekhnath",
                    price: "Rs 1000/plate",
                    image: "assets/background.jpg",
                    onTap: () {},
                  ),
                  const SizedBox(width: 10), // Add spacing between tiles
                  ItemTile(
                    title: "Namaste Party",
                    location: "Lekhnath",
                    price: "Rs 1000/plate",
                    image: "assets/background.jpg",
                    onTap: () {},
                  ),
                  const SizedBox(width: 10), // Add spacing between tiles
                  ItemTile(
                    title: "Namaste Party",
                    location: "Lekhnath",
                    price: "Rs 1000/plate",
                    image: "assets/background.jpg",
                    onTap: () {},
                  ),
                  const SizedBox(width: 10), // Add spacing between tiles
                  ItemTile(
                    title: "Namaste Party",
                    location: "Lekhnath",
                    price: "Rs 1000/plate",
                    image: "assets/background.jpg",
                    onTap: () {},
                  ),
                  const SizedBox(width: 10), // Add spacing between tiles
                  ItemTile(
                    title: "Namaste Party",
                    location: "Lekhnath",
                    price: "Rs 1000/plate",
                    image: "assets/background.jpg",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section header with "View All" button
  Widget _buildSectionHeader(BuildContext context, String title, Widget page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () => _navigateTo(context, page),
          child: const Text("View All"),
        ),
      ],
    );
  }

  // Navigation function
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
