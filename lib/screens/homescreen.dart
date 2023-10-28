import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_news_app/models/users.dart';
import 'package:travel_news_app/screens/post_details.dart';
import 'package:travel_news_app/screens/user_profile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM').format(now);

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 245, 245, 245),
        child: Column(
          children: [
            UserProfileHeader(formattedDate),
            SizedBox(height: 32),
            SearchBar(),
            SizedBox(height: 20),
            TagList(['#Health', '#Music', '#Technology', '#Sports']),
            SizedBox(height: 30),
            BoxList(),
            SizedBox(height: 30),
            SectionHeader('Short for you', 'View all'),
            SizedBox(height: 20),
            BoxList2(),
            SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 375,
                  height: 82,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/nav.png'), // Replace 'assets/feature1.png' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  final String formattedDate;

  UserProfileHeader(this.formattedDate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/dp.png'), // Replace 'assets/feature1.png' with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back',
                style: TextStyle(
                  color: Color(0xFF19202D),
                  fontSize: 16,
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Date: $formattedDate',
                style: TextStyle(
                  color: Color(0xFF9397A0),
                  fontSize: 12,
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // You can change the color as needed
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for an article',
                border: InputBorder.none, // Remove the border here
                contentPadding:
                    EdgeInsets.all(16), // Adjust the padding as needed
              ),
            ),
          ),
          Positioned(
            right: 0, // Adjust the position as needed
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue, // Change the color as needed
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/search.png'), // Replace 'assets/feature1.png' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TagList extends StatelessWidget {
  final List<String> tags;

  TagList(this.tags);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: tags.map((tag) => TagText(tag)).toList(),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String action;

  SectionHeader(this.title, this.action);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            action,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class BoxList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 20),
          Container(
            width: 255,
            height: 304,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetailsScreen(
                            user: SampleData.user1,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 231,
                          height: 164,
                          child: Image.network(
                            SampleData.user1.postsList[0].photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          SampleData.user1.postsList[0].title,
                          style: TextStyle(
                            color: Color(0xFF19202D),
                            fontSize: 15,
                            fontFamily: 'Gellix',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to UserProfile screen and pass the user
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserProfileScreen(user: SampleData.user1),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  SampleData.user1.profilePicture,
                                  width: 38,
                                  height: 38,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${SampleData.user1.firstName} ${SampleData.user1.lastName}',
                                      style: TextStyle(
                                        color: Color(0xFF19202D),
                                        fontSize: 12,
                                        fontFamily: 'Gellix',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      SampleData.user1.postsList[0].day +
                                          ' ' +
                                          SampleData.user1.postsList[0].month +
                                          ', ' +
                                          SampleData.user1.postsList[0].year,
                                      style: TextStyle(
                                        color: Color(0xFF19202D),
                                        fontSize: 12,
                                        fontFamily: 'Gellix',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 50),
                            Stack(
                              children: [
                                Container(
                                  width: 37,
                                  height: 37,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/send.png'), // Replace 'assets/feature1.png' with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 255,
            height: 304,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetailsScreen(
                            user: SampleData.user2,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 231,
                          height: 164,
                          child: Image.network(
                            SampleData.user2.postsList[0].photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          SampleData.user2.postsList[0].title,
                          style: TextStyle(
                            color: Color(0xFF19202D),
                            fontSize: 15,
                            fontFamily: 'Gellix',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to UserProfile screen and pass the user
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserProfileScreen(user: SampleData.user2),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  SampleData.user1.profilePicture,
                                  width: 38,
                                  height: 38,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${SampleData.user1.firstName} ${SampleData.user1.lastName}',
                                      style: TextStyle(
                                        color: Color(0xFF19202D),
                                        fontSize: 12,
                                        fontFamily: 'Gellix',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      SampleData.user2.postsList[0].day +
                                          ' ' +
                                          SampleData.user2.postsList[0].month +
                                          ', ' +
                                          SampleData.user2.postsList[0].year,
                                      style: TextStyle(
                                        color: Color(0xFF19202D),
                                        fontSize: 12,
                                        fontFamily: 'Gellix',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 50),
                            Stack(
                              children: [
                                Container(
                                  width: 37,
                                  height: 37,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/send.png'), // Replace 'assets/feature1.png' with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 255,
            height: 304,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetailsScreen(
                            user: SampleData.user3,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 231,
                          height: 164,
                          child: Image.network(
                            SampleData.user3.postsList[0].photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          SampleData.user3.postsList[0].title,
                          style: TextStyle(
                            color: Color(0xFF19202D),
                            fontSize: 15,
                            fontFamily: 'Gellix',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to UserProfile screen and pass the user
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserProfileScreen(user: SampleData.user3),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  SampleData.user3.profilePicture,
                                  width: 38,
                                  height: 38,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${SampleData.user3.firstName} ${SampleData.user3.lastName}',
                                      style: TextStyle(
                                        color: Color(0xFF19202D),
                                        fontSize: 12,
                                        fontFamily: 'Gellix',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      SampleData.user3.postsList[0].day +
                                          ' ' +
                                          SampleData.user3.postsList[0].month +
                                          ', ' +
                                          SampleData.user3.postsList[0].year,
                                      style: TextStyle(
                                        color: Color(0xFF19202D),
                                        fontSize: 12,
                                        fontFamily: 'Gellix',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 50),
                            Stack(
                              children: [
                                Container(
                                  width: 37,
                                  height: 37,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/send.png'), // Replace 'assets/feature1.png' with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class BoxList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 208,
            height: 88,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/shorts.png'), // Replace 'assets/feature1.png' with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 208,
            height: 88,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/shorts.png'), // Replace 'assets/feature1.png' with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 208,
            height: 88,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/shorts.png'), // Replace 'assets/feature1.png' with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class TagText extends StatelessWidget {
  final String text;

  TagText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
    );
  }
}
