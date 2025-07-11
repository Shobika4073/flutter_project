import 'package:flutter/material.dart';
import 'package:flutter_app/view/dashboard_view.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardView()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF58529), // orange
                  Color(0xFFDD2A7B), // pink
                  Color(0xFF8134AF), // purple
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Center(
            child: Text(
              'Search Results will appear here.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardView()));
                  },
                  icon: Icon(Icons.arrow_back)),
              SizedBox(
                width: 20,
              ),
              Text(
                'Post',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF58529), // orange
                  Color(0xFFDD2A7B), // pink
                  Color(0xFF8134AF), // purple
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 300),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text('Add your post here!', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}

class LikesPage extends StatefulWidget {
  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardView()));
                  },
                  icon: Icon(Icons.arrow_back)),
              SizedBox(
                width: 20,
              ),
              Text(
                'Reels',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF58529), // orange
                  Color(0xFFDD2A7B), // pink
                  Color(0xFF8134AF), // purple
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 300),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Text('You have no new Reels.',
                          style: TextStyle(fontSize: 18)),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
