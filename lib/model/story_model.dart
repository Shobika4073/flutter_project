class Story {
  final String username;
  final String image;
  bool viewed;
  final String profileImage;
  final DateTime viewedTime;

  Story({
    required this.username,
    required this.image,
    required this.viewed,
    required this.profileImage,
    required this.viewedTime,
  });
}