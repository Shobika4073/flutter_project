import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../model/story_model.dart';

class HomeViewModel extends ChangeNotifier {

  final List<Story> stories = [
    Story(username: 'Sai', image: 'lib/assets/img16.png', viewed: false, profileImage: 'lib/assets/img2.png', viewedTime: DateTime.now()),
    Story(username: 'Sarath', image: 'lib/assets/img14.png', viewed: false, profileImage: 'lib/assets/img11.png', viewedTime: DateTime.now()),
    Story(username: 'Priya', image: 'lib/assets/img11.png', viewed: false, profileImage: 'lib/assets/img4.png', viewedTime: DateTime.now()),
    Story(username: 'Sanjay', image: 'lib/assets/img9.png', viewed: false, profileImage: 'lib/assets/img5.png', viewedTime: DateTime.now()),
    Story(username: 'Guna', image: 'lib/assets/img17.png', viewed: false, profileImage: 'lib/assets/img12.png', viewedTime: DateTime.now()),
    Story(username: 'Anupriya', image: 'lib/assets/img1.png', viewed: false, profileImage: 'lib/assets/img1.png', viewedTime: DateTime.now()),
    Story(username: 'Deva', image: 'lib/assets/img16.png', viewed: false, profileImage: 'lib/assets/img15.png', viewedTime: DateTime.now()),
    Story(username: 'Karthik', image: 'lib/assets/img3.png', viewed: false, profileImage: 'lib/assets/img3.png', viewedTime: DateTime.now()),
    Story(username: 'Sneha', image: 'lib/assets/img4.png', viewed: false, profileImage: 'lib/assets/img4.png', viewedTime: DateTime.now()),
    Story(username: 'Vishnu', image: 'lib/assets/img5.png', viewed: false, profileImage: 'lib/assets/img5.png', viewedTime: DateTime.now()),
    Story(username: 'Ramya', image: 'lib/assets/img4.png', viewed: false, profileImage: 'lib/assets/img1.png', viewedTime: DateTime.now()),
    Story(username: 'Manoj', image: 'lib/assets/img1.png', viewed: false, profileImage: 'lib/assets/img6.png', viewedTime: DateTime.now()),
  ];


  final List<Post> posts = [
    Post(
      username: 'love.connection_',
      userImage: 'lib/assets/img1.png',
      postImage: 'lib/assets/img8.png',
      likes: 1234,
      caption: 'Lovely and Plesant place',
      comments: 24,
      timeAgo: '2 hours ago',
      likeCount: 390,
      commentCount: 3,
      shareCount: 10,
      leadingLiker: '_shruthi_27__',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Amazing post!',
          time: DateTime.now().subtract(Duration(minutes: 5)),
          isCommentLiked: false,
        ),
        Comment(
          username: 'haritha',
          userImage: 'lib/assets/img14.png',
          commentText: 'Beautiful!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
        Comment(
          username: 'rajeevkp',
          userImage: 'lib/assets/img11.png',
          commentText: 'Love this!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
      ],
    ),
    Post(
      username: 'Sanjay',
      userImage: 'lib/assets/img5.png',
      postImage: 'lib/assets/img9.png',
      likes: 876,
      caption: 'Enjoying the sunset at the beach!',
      comments: 12,
      timeAgo: '18 hours ago',
      likeCount: 12098,
      commentCount: 1,
      shareCount: 200,
      leadingLiker: '_shruthi_27__',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Nice Place......!',
          time: DateTime.now().subtract(Duration(minutes: 5)),
        ),
      ],
    ),
    Post(
      username: 'haritha.lakshman',
      userImage: 'lib/assets/img4.png',
      postImage: 'lib/assets/img10.png',
      likes: 2105,
      caption: 'City lights never looked better!',
      comments: 42,
      timeAgo: '3 days ago',
      leadingLiker: '_shruthi_27__',
      likeCount: 58,
      commentCount: 2,
      shareCount: 5,
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Nice...',
          time: DateTime.now().subtract(Duration(minutes: 5)),
        ),
        Comment(
          username: 'rajeevkp',
          userImage: 'lib/assets/img11.png',
          commentText: 'Love this!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
      ],
    ),
    Post(
      username: 'Sai',
      userImage: 'lib/assets/img2.png',
      postImage: 'lib/assets/img4.png',
      likes: 1234,
      caption: 'My Kitta....',
      comments: 24,
      timeAgo: '2 hours ago',
      likeCount: 3090,
      commentCount: 5,
      shareCount: 10,
      leadingLiker: '_shruthi_27__',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Amazing post!',
          time: DateTime.now().subtract(Duration(minutes: 5)),
          isCommentLiked: false,
        ),
        Comment(
          username: 'haritha',
          userImage: 'lib/assets/img14.png',
          commentText: 'Beautiful!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
        Comment(
          username: 'rajeevkp',
          userImage: 'lib/assets/img11.png',
          commentText: 'Love this!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
        Comment(
          username: 'Sadha',
          userImage: 'lib/assets/img6.png',
          commentText: 'Cute....',
          time: DateTime.now().subtract(Duration(minutes: 5)),
          isCommentLiked: false,
        ),
        Comment(
          username: 'rayan',
          userImage: 'lib/assets/img15.png',
          commentText: 'Beautiful!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
      ],
    ),
    Post(
      username: 'Karthick',
      userImage: 'lib/assets/img3.png',
      postImage: 'lib/assets/img15.png',
      likes: 1234,
      caption: 'Lonely',
      comments: 24,
      timeAgo: '2 hours ago',
      likeCount: 390,
      commentCount: 1,
      shareCount: 10,
      leadingLiker: '_shruthi_27__',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: 'rajeevkp',
          userImage: 'lib/assets/img11.png',
          commentText: 'Love this!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
      ],
    ),
    Post(
      username: 'Sneha',
      userImage: 'lib/assets/img13.png',
      postImage: 'lib/assets/img16.png',
      likes: 1234,
      caption: 'Lovely and Plesant place',
      comments: 24,
      timeAgo: '2 hours ago',
      likeCount: 39,
      commentCount: 2,
      shareCount: 10,
      leadingLiker: 'Ganesh',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Amazing Place!',
          time: DateTime.now().subtract(Duration(minutes: 5)),
          isCommentLiked: false,
        ),
        Comment(
          username: 'haritha',
          userImage: 'lib/assets/img14.png',
          commentText: 'Beautiful!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
      ],
    ),
    Post(
      username: 'Deva',
      userImage: 'lib/assets/img15.png',
      postImage: 'lib/assets/img7.png',
      likes: 1234,
      caption: 'Belive urself',
      comments: 24,
      timeAgo: '2 hours ago',
      likeCount: 13390,
      commentCount: 6,
      shareCount: 101,
      leadingLiker: '_shruthi_27__',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Super',
          time: DateTime.now().subtract(Duration(minutes: 5)),
          isCommentLiked: false,
        ),
        Comment(
          username: 'haritha',
          userImage: 'lib/assets/img14.png',
          commentText: 'Beautiful!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
        Comment(
          username: 'rajeevkp',
          userImage: 'lib/assets/img11.png',
          commentText: 'Power......!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
        Comment(
          username: 'Sabari',
          userImage: 'lib/assets/img5.png',
          commentText: 'Mass!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
        Comment(
          username: 'Sanju',
          userImage: 'lib/assets/img12.png',
          commentText: 'Power......!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
        Comment(
          username: 'Kiran',
          userImage: 'lib/assets/img10.png',
          commentText: 'Power',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
      ],
    ),
    Post(
      username: 'Vimal_Raj',
      userImage: 'lib/assets/img6.png',
      postImage: 'lib/assets/img5.png',
      likes: 1234,
      caption: 'Lovely and Plesant place',
      comments: 24,
      timeAgo: '2 hours ago',
      likeCount: 390,
      commentCount: 5,
      shareCount: 10,
      leadingLiker: '_shruthi_27__',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Amazing post!',
          time: DateTime.now().subtract(Duration(minutes: 5)),
          isCommentLiked: false,
        ),
        Comment(
          username: 'haritha',
          userImage: 'lib/assets/img14.png',
          commentText: 'Beautiful!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
        Comment(
          username: 'rajeevkp',
          userImage: 'lib/assets/img11.png',
          commentText: 'Love this!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
      ],
    ),
    Post(
      username: 'AnuShree_._',
      userImage: 'lib/assets/img14.png',
      postImage: 'lib/assets/img14.png',
      likes: 1234,
      caption: 'Lovely and Plesant place',
      comments: 24,
      timeAgo: '2 hours ago',
      likeCount: 390,
      commentCount: 5,
      shareCount: 10,
      leadingLiker: '_shruthi_27__',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Amazing post!',
          time: DateTime.now().subtract(Duration(minutes: 5)),
          isCommentLiked: false,
        ),
        Comment(
          username: 'haritha',
          userImage: 'lib/assets/img14.png',
          commentText: 'Beautiful!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
      ],
    ),
    Post(
      username: 'Mom_Boy',
      userImage: 'lib/assets/img11.png',
      postImage: 'lib/assets/img16.png',
      likes: 1234,
      caption: 'Lovely and Plesant place',
      comments: 24,
      timeAgo: '2 hours ago',
      likeCount: 390,
      commentCount: 4,
      shareCount: 10,
      leadingLiker: 'Sanju',
      isLiked: false,
      isBookmarked: false,
      usercomments: [
        Comment(
          username: '_shruthi_27__',
          userImage: 'lib/assets/img13.png',
          commentText: 'Amazing post!',
          time: DateTime.now().subtract(Duration(minutes: 5)),
          isCommentLiked: false,
        ),
        Comment(
          username: 'haritha',
          userImage: 'lib/assets/img14.png',
          commentText: 'Beautiful!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
        Comment(
          username: 'rajeevkp',
          userImage: 'lib/assets/img11.png',
          commentText: 'Love this!',
          time: DateTime.now().subtract(Duration(minutes: 1)),
        ),
        Comment(
          username: 'Hari',
          userImage: 'lib/assets/img6.png',
          commentText: 'Crazy!',
          time: DateTime.now().subtract(Duration(minutes: 3)),
        ),
      ],
    ),

  ];

  void toggleLike(Post post) {
    post.isLiked = !post.isLiked;
    post.isLiked ? post.likeCount++ : post.likeCount--;
    notifyListeners();
  }

  void toggleBookmark(Post post) {
    post.isBookmarked = !post.isBookmarked;
    notifyListeners();
  }

  void incrementComment(Post post) {
    post.commentCount++;
    notifyListeners();
  }

  void incrementShare(Post post) {
    post.shareCount++;
    notifyListeners();
  }

  void viewStory(int index) {
    stories[index].viewed = true;
    final story = stories.removeAt(index);
    stories.add(story);
    notifyListeners();
  }

}
