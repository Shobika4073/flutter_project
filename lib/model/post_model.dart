class Post {
  final String username;
  final String userImage;
  final String postImage;
  final int likes;
  final String caption;
  final bool isAd;
  final String? adBrand;
  final String? adTitle;
  final String? adDescription;
  final String? adDate;
  final int comments;
  final String timeAgo;
  int likeCount;
  int commentCount;
  int shareCount;
  String leadingLiker;
  bool isLiked;
  bool isBookmarked;
  List<Comment> usercomments = [];

  Post({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.likes,
    required this.caption,
    this.isAd = false,
    this.adBrand,
    this.adTitle,
    this.adDescription,
    this.adDate,
    required this.comments,
    required this.timeAgo,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.leadingLiker,
    this.isLiked = false,
    this.isBookmarked = false,
    required this.usercomments,
  });
}


class Comment {
  final String username;
  final String userImage;
  final String commentText;
  final DateTime time;
  bool isCommentLiked;

  Comment({
    required this.username,
    required this.userImage,
    required this.commentText,
    required this.time,
    this.isCommentLiked = false,
  });
}