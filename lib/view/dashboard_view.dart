import 'package:flutter/material.dart';
import 'package:flutter_app/view/home_view.dart';
import 'package:flutter_app/view/search_view.dart';
import 'profile_view.dart';

class DashboardView extends StatefulWidget {
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Define labels for each navigation item
  final List<String> _labels = ['Home', 'Search', 'Add', 'Likes', 'Profile'];

  final List<Widget> _pages = [
    HomePage(key: GlobalKey()),
    SearchPage(),
    AddPostPage(),
    LikesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFDD2A7B), // Pink color for selected items
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.search, 1),
          _buildNavItem(Icons.add_box_outlined, 2),
          _buildNavItem(Icons.favorite_border, 3),
          _buildNavItem(Icons.account_circle, 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData iconData, int index) {
    final isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      label: isSelected ? _labels[index] : '',
      icon: Container(
        padding: const EdgeInsets.only(bottom: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              Container(
                height: 3,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDD2A7B),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            SizedBox(height: isSelected ? 4 : 7),
            index == 4
                ? CircleAvatar(
              radius: isSelected ? 13 : 12,
              backgroundColor: isSelected ? Color(0xFFDD2A7B) : Colors.grey.shade300,
              child: CircleAvatar(
                radius: isSelected ? 21.5 : 20.5,
                backgroundImage: AssetImage('lib/assets/img1.png'), // <-- your image path here
              ),
            )
                : isSelected
                ? ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xFFF58529),
                    Color(0xFFDD2A7B),
                    Color(0xFF8134AF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            )
                : Icon(
              iconData,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}