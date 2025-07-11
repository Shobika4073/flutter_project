import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../viewmodel/home_view_model.dart';
import 'login_view.dart';
import '../model/post_model.dart';
import '../model/story_model.dart';
import 'storyscreen_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showCommentsBottomSheet(
      BuildContext context, HomeViewModel vm, Post post) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Comments',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: post.usercomments.length,
                      itemBuilder: (context, index) {
                        final comment = post.usercomments[index];
                        final minutesAgo =
                            DateTime.now().difference(comment.time).inMinutes;

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(comment.userImage),
                          ),
                          title: Row(
                            children: [
                              Text(
                                comment.username,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '$minutesAgo min ago',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(comment.commentText),
                          trailing: IconButton(
                            icon: Icon(
                              comment.isCommentLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: comment.isCommentLiked ? Colors.red : null,
                            ),
                            onPressed: () {
                              setState(() {
                                comment.isCommentLiked =
                                    !comment.isCommentLiked;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage('lib/assets/img1.png'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Add a comment...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                            ),
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  post.usercomments.add(Comment(
                                    username: 'You',
                                    userImage: 'lib/assets/img1.png',
                                    commentText: value,
                                    time: DateTime.now(),
                                  ));
                                  post.commentCount++;
                                });
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "lib/assets/insta_logo.png",
                    width: 150,
                  ),
                  //SizedBox(width: 250,),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () {}),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/chat.png",
                      height: 20,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Logout"),
                              content: Text("Do you want to logout?"),
                              actions: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.pink[900]),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setBool('isLoggedIn', false);
                                      Navigator.of(context).pop();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(color: Colors.pink[900]),
                                    )),
                              ],
                            );
                          });
                    },
                  )
                ],
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      vm.stories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _buildAddStoryCircle();
                    }
                    return _buildStoryCircle(vm.stories[index - 1], index - 1);
                  },
                ),
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
              ...vm.posts.map((post) => _buildPost(context, vm, post)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddStoryCircle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipOval(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Image.asset(
                    'lib/assets/img1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(Icons.add, size: 12, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text('Your story', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildStoryCircle(Story story, int index) {
    final vm = Provider.of<HomeViewModel>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          story.viewed = true;
          final viewedStory = vm.stories.removeAt(index);
          vm.stories.add(viewedStory);
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StoryViewScreen(
              image: story.image,
              username: story.username,
              profileImage: story.profileImage,
              viewedTime: story.viewedTime,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: story.viewed ? Colors.grey : Colors.pink,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipOval(
                  child: Image.asset(
                    story.profileImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              story.username,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPost(BuildContext context, HomeViewModel vm, Post post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: ClipOval(
                  child: Image.asset(
                    post.userImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(post.username),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _iconWithText(Icons.bookmark_border, 'Save'),
                                  _iconWithText(Icons.loop, 'Remix'),
                                  _iconWithText(Icons.qr_code, 'QR code'),
                                ],
                              ),
                            ),
                            Divider(),
                            _bottomSheetTile(
                                Icons.star_border, 'Add to favorites'),
                            _bottomSheetTile(
                                Icons.person_remove_alt_1, 'Unfollow'),
                            _bottomSheetTile(Icons.info_outline,
                                'Why you\'re seeing this post'),
                            _bottomSheetTile(Icons.visibility_off, 'Hide'),
                            _bottomSheetTile(Icons.info, 'About this account'),
                            ListTile(
                              leading: Icon(Icons.report, color: Colors.red),
                              title: Text('Report',
                                  style: TextStyle(color: Colors.red)),
                              onTap: () {
                                Navigator.pop(context);
                                // Handle Report
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Container(
          height: 500,
          child: Image.asset(
            post.postImage,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  vm.toggleLike(post);
                },
                child: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: post.isLiked ? Colors.red : null,
                ),
              ),
              Text(post.likeCount.toString()),
              SizedBox(width: 15),
              GestureDetector(
                  onTap: () {
                    _showCommentsBottomSheet(context, vm, post);
                  },
                  child: Image.asset(
                    "lib/assets/msg.png",
                    height: 25,
                  )),
              SizedBox(width: 5),
              Text(post.commentCount.toString()),
              SizedBox(width: 15),
              GestureDetector(
                  onTap: () {
                    vm.incrementShare(post);
                  },
                  child: Image.asset(
                    "lib/assets/arrow.png",
                    height: 25,
                  )),
              Text(post.shareCount.toString()),
              Spacer(),
              IconButton(
                icon: Icon(
                  post.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                ),
                onPressed: () {
                  vm.toggleBookmark(post);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        post.isBookmarked ? 'Saved' : 'Removed from saved'),
                    duration: Duration(seconds: 1),
                  ));
                },
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  "Liked By",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${post.leadingLiker} '),
                Text("and Others.")
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text.rich(
            TextSpan(
              text: '${post.username} ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              children: [
                TextSpan(
                    text: post.caption,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Text(post.timeAgo,
              style: TextStyle(color: Colors.grey, fontSize: 10)),
        ),
      ],
    );
  }

  Widget _iconWithText(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 28),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _bottomSheetTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
