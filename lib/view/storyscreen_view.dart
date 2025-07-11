import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StoryViewScreen extends StatefulWidget {
  final String image;
  final String username;
  final String profileImage;
  final DateTime viewedTime;

  StoryViewScreen({
    required this.image,
    required this.username,
    required this.profileImage,
    required this.viewedTime,
  });

  @override
  _StoryViewScreenState createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  bool liked = false;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm a').format(widget.viewedTime);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            widget.image,
            fit: BoxFit.contain,
          ),
          // Semi-transparent Overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          // Top User Info
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 700),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.profileImage),
                      radius: 25,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        formattedTime,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom Like and Message Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Send message...',
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            // Handle send action
                            print("Message: ${_messageController.text}");
                            _messageController.clear();
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? Colors.red : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              liked = !liked;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
