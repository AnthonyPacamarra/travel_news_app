class User {
  String profilePicture;
  String firstName;
  String lastName;
  String work;
  String bio;
  String followers;
  String posts;
  String following;
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
  String photo;
  String theme;
  String title;
  String day;
  String month;
  String year;
  String time;
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
  String photo;

  Featured({
    required this.photo,
  });
}
