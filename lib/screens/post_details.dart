import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_news_app/models/models.dart';
import 'package:travel_news_app/screens/user_profile.dart';

class PostDetailsScreen extends StatefulWidget {
  final User user;

  PostDetailsScreen({required this.user});

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                items: widget.user.featuredList
                    .map((featured) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(featured.photo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlide = index;
                    });
                  },
                  autoPlay: true,
                  enlargeCenterPage: false,
                  aspectRatio: 16 / 20,
                  viewportFraction: 1,
                ),
              ),
            ],
          ),
          Positioned(
            top: 375,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.user.featuredList.map((item) {
                int index = widget.user.featuredList.indexOf(item);
                return Container(
                  width: 12,
                  height: 12,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: index == _currentSlide
                        ? BoxShape.rectangle 
                        : BoxShape.circle,
                    color: index == _currentSlide ? Colors.black : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: NavIcon(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PostInfo(user: widget.user, currentSlide: _currentSlide),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 375,
                  height: 82,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/nav.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/back.png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 215),
        Container(
          width: 50, 
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/bookmark.png'), 
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class PostInfo extends StatelessWidget {
  final User user;
  final int currentSlide;

  PostInfo({required this.user, required this.currentSlide});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 412,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 25,
              left: 40,
              right: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.postsList[0].title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserProfileScreen(user: user),
                      ),
                    );
                  },
                  child: Container(
                    width: 315,
                    height: 54,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 14),
                        Row(
                          children: [
                            SizedBox(width: 14),
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(user.profilePicture),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '${user.firstName} ${user.lastName}',
                              style: TextStyle(
                                color: Color(0xFF19202D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(' • '),
                            Text(
                              '${user.postsList[0].month} '
                              '${user.postsList[0].day}',
                              style: TextStyle(
                                color: Color(0xFF19202D),
                                fontSize: 14, 
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(' • '),
                            Text(
                              '8 min read', 
                              style: TextStyle(
                                color: Color(0xFF19202D),
                                fontSize: 14, 
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  user.postsList[0].content,
                  style: TextStyle(
                    color: Color(0xFF19202D),
                    fontSize: 16,
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
