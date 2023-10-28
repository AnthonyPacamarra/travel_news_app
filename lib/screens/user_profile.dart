import 'package:flutter/material.dart';
import 'package:travel_news_app/models/models.dart';

class UserProfileScreen extends StatelessWidget {
  final User user;

  UserProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileHeader(user: user),
            SizedBox(height: 20),
            Text(
              user.bio,
              style: TextStyle(
                color: Color(0xFF9397A0),
                fontSize: 12,
                fontFamily: 'Gellix',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            SizedBox(height: 33),
            StatisticsContainer(user: user),
            SizedBox(height: 30),
            SectionTitle("${user.firstName}'s Posts"),
            SizedBox(height: 10),
            Expanded(
              child: NewsArticleList(
                  posts: user.postsList), // Pass the user's posts
            ),
            SizedBox(height: 30),
            SectionTitle("Popular From ${user.firstName}"),
            SizedBox(height: 20),
            ImageCarousel(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  final User user;

  UserProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(user.profilePicture),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              SizedBox(height: 5),
              Text(
                user.work,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          FollowButton(),
        ],
      ),
    );
  }
}

class FollowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Following',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class StatisticsContainer extends StatelessWidget {
  final User user;

  StatisticsContainer({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 95,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatisticItem(user.followers, 'Followers'),
          CustomDivider(),
          StatisticItem(user.posts, 'Posts'),
          CustomDivider(),
          StatisticItem(user.following, 'Following'),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 50,
      color: Colors.grey,
    );
  }
}

class StatisticItem extends StatelessWidget {
  final String value;
  final String label;

  StatisticItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        SizedBox(height: 15),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF19202D),
        fontSize: 17,
        fontFamily: 'Gellix',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    );
  }
}

class NewsArticleItem extends StatelessWidget {
  final Post post; // Accept a post

  NewsArticleItem({required this.post}); // Constructor to initialize the post

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArticleImage(),
          SizedBox(width: 10),
          ArticleText(post: post), // Pass the post to ArticleText
        ],
      ),
    );
  }
}

class NewsArticleList extends StatelessWidget {
  final List<Post> posts; // Accept a list of posts

  NewsArticleList({required this.posts}); // Constructor to initialize posts

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          for (var post in posts)
            Column(
              children: [
                NewsArticleItem(post: post), // Pass the current post
                SizedBox(height: 15),
              ],
            ),
        ],
      ),
    );
  }
}

class ArticleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/post1.png'), // Replace 'assets/feature1.png' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class ArticleText extends StatelessWidget {
  final Post post; // Accept a post

  ArticleText({required this.post}); // Constructor to initialize the post

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          "News: ${post.theme}",
          style: TextStyle(
            color: Color(0xFF9397A0),
            fontSize: 10,
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Text(
          post.title, // Display the post's content
          style: TextStyle(
            color: Color(0xFF19202D),
            fontSize: 14,
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/calendar.png'), // Replace 'assets/feature1.png' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
            ),
            SizedBox(width: 5),
            Text("16th May"),
            SizedBox(width: 40),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/time.png'), // Replace 'assets/feature1.png' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
            ),
            SizedBox(width: 5),
            Text("09:32 pm"),
          ],
        ),
      ],
    );
  }
}

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 143,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CarouselItem(),
          SizedBox(width: 15),
          CarouselItem(),
          SizedBox(width: 15),
          CarouselItem(),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      height: 143,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/featured1.png'), // Replace 'assets/feature1.png' with your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
