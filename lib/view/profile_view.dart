import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTabIndex = 0;
  String? userEmail = '';
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadEmail();
    _loadUsername();
    print("${_loadEmail}-------------");
  }

  void _loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('userEmail');
    setState(() {
      userEmail = email ?? 'Unknown Email';
    });
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'No Username';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          username,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.share_outlined,
          ),
          SizedBox(width: 16),
          Icon(Icons.add_box_outlined),
          SizedBox(width: 16),
          Icon(
            Icons.menu,
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: 38,
                          color: Colors.grey[700],
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add, color: Colors.white, size: 14),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  _buildStatColumn('32', 'Posts'),
                  _buildStatColumn('58', 'Followers'),
                  _buildStatColumn('169', 'Following'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Crazy One..!',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'Born on jan30\n'
                    'Dad princess',
                  ),
                  SizedBox(height: 4),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mail_outline),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$userEmail',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey),
                      ),
                      child: Text('Edit profile',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey),
                      ),
                      child: Text('Share profile',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: Icon(Icons.person_add_alt, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = 0;
                    });
                  },
                  child: Icon(
                    Icons.grid_on,
                    size: 40,
                    color: selectedTabIndex == 0 ? Colors.black : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = 1;
                    });
                  },
                  child: Icon(
                    Icons.movie,
                    size: 40,
                    color: selectedTabIndex == 1 ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            if (selectedTabIndex == 0)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Center(
                    child: Text(
                  "Capture Moment with Friend",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Center(
                    child: Text(
                  "Share Moment with World",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text(label, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
