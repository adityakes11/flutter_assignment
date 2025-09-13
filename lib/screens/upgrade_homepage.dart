import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // TODO: add navigation logic here (push to other screens)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Top AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Mixer",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bolt_circle_fill, color: Colors.purple),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.bell, color: Colors.purple),
            onPressed: () {},
          ),
        ],
      ),

      // ✅ Page body
      body: Column(
        children: [
          // Filters Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: const [
                FilterChipWidget(
                  label: "Filters",
                  selected: true,
                  icon: CupertinoIcons.slider_horizontal_3,
                ),
                SizedBox(width: 10),
                FilterChipWidget(label: "Age"),
                SizedBox(width: 10),
                FilterChipWidget(label: "Height"),
                SizedBox(width: 10),
                FilterChipWidget(label: "Habits"),
              ],
            ),
          ),
          const SizedBox(height: 90),

          // Profile Circles with overlap
          SizedBox(
            height: 90,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Left avatar
                Positioned(
                  left: 55,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/images/image3.png'),
                    ),
                  ),
                ),

                // Right avatar
                Positioned(
                  right: 55,
                  child: CircleAvatar(
                    radius: 49,
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/images/image1.png'),
                    ),
                  ),
                ),

                // Middle avatar (on top)
                CircleAvatar(
                  radius: 49,
                  backgroundColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/image2.png'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),

          // Title
          const Text(
            "You’ve seen everyone nearby",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          // Subtitle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "No more profiles in your area. Check back later or expand your location to see more people.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 60),

          // Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6A1B9A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
            ),
            child: const Text(
              "Adjust Location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.refresh),
            label: "Refresh",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye),
            label: "Views",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// ✅ Custom Filter Chip Widget
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool selected;
  final IconData? icon;

  const FilterChipWidget({
    super.key,
    required this.label,
    this.selected = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.purple.shade50 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: Colors.purple),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.purple : Colors.black,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
