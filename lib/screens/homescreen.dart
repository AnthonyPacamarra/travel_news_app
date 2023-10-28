import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM').format(now);

    return Scaffold(
      body: Container(
        color: Colors.yellow,
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
            color: Colors.blue,
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
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
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
            color: Colors.brown,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxWidget(231, 164),
                  SizedBox(height: 18),
                  Text(
                    'Feel the thrill on the only\nsurf simulator in Maldives',
                    style: TextStyle(
                      color: Color(0xFF19202D),
                      fontSize: 15,
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      BoxWidget(38, 38),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sang Dong-Min',
                            style: TextStyle(
                              color: Color(0xFF19202D),
                              fontSize: 12,
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Sept 9,2022',
                            style: TextStyle(
                              color: Color(0xFF19202D),
                              fontSize: 12,
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 55),
                      Stack(
                        children: [BoxWidget(37, 37)],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 255,
            height: 304,
            color: Colors.brown,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxWidget(231, 164),
                  SizedBox(height: 18),
                  Text(
                    'Feel the thrill on the only\nsurf simulator in Maldives',
                    style: TextStyle(
                      color: Color(0xFF19202D),
                      fontSize: 15,
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      BoxWidget(38, 38),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sang Dong-Min',
                            style: TextStyle(
                              color: Color(0xFF19202D),
                              fontSize: 12,
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Sept 9,2022',
                            style: TextStyle(
                              color: Color(0xFF19202D),
                              fontSize: 12,
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 55),
                      Stack(
                        children: [BoxWidget(37, 37)],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 255,
            height: 304,
            color: Colors.brown,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxWidget(231, 164),
                  SizedBox(height: 18),
                  Text(
                    'Feel the thrill on the only\nsurf simulator in Maldives',
                    style: TextStyle(
                      color: Color(0xFF19202D),
                      fontSize: 15,
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      BoxWidget(38, 38),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sang Dong-Min',
                            style: TextStyle(
                              color: Color(0xFF19202D),
                              fontSize: 12,
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Sept 9,2022',
                            style: TextStyle(
                              color: Color(0xFF19202D),
                              fontSize: 12,
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 55),
                      Stack(
                        children: [BoxWidget(37, 37)],
                      )
                    ],
                  )
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
          SizedBox(width: 20),
          BoxWidget(208, 88),
          SizedBox(width: 20),
          BoxWidget(208, 88),
          SizedBox(width: 20),
          BoxWidget(208, 88),
          SizedBox(width: 20),
          BoxWidget(208, 88),
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

class BoxWidget extends StatelessWidget {
  final double width;
  final double height;

  BoxWidget(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey,
    );
  }
}
