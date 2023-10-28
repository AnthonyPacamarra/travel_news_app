class User {
  String profilePicture; // image URL
  String firstName;
  String lastName;
  String work;
  String bio;
  String followers; // text
  String posts; // text
  String following; // text
  List<Post> postsList = [];
  List<Featured> featuredList = [];

  User({
    required this.profilePicture,
    required this.firstName,
    required this.lastName,
    required this.work,
    required this.bio,
    required this.followers,
    required this.posts,
    required this.following,
    required this.postsList,
    required this.featuredList,
  });
}

class Post {
  String photo; // image URL
  String theme;
  String title;
  String day; // text
  String month; // text
  String year; // text
  String time; // text
  String content;

  Post({
    required this.photo,
    required this.theme,
    required this.title,
    required this.day,
    required this.month,
    required this.year,
    required this.time,
    required this.content,
  });
}

class Featured {
  String photo; // image URL

  Featured({
    required this.photo,
  });
}