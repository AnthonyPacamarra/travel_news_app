import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostDetailsScreen extends StatefulWidget {
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
                items: PostInfo.items,
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
              children: PostInfo.items.map((item) {
                int index = PostInfo.items.indexOf(item);
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
            child: PostInfo(),
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
        Container(
          width: 50, // Adjust the width as needed
          height: 50, // Adjust the height as needed
          color: Colors.grey,
        ),
        SizedBox(width: 215),
        Container(
          width: 50, // Adjust the width as needed
          height: 50, // Adjust the height as needed
          color: Colors.grey,
        ),
      ],
    );
  }
}

class PostInfo extends StatelessWidget {
  
  static List<Widget> items = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

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
                right: 40), // Margin for the entire column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                            color: Colors.grey,
                          ),
                          SizedBox(width: 8),
                          Text('Name'),
                          Text(' • '),
                          Text('Date'),
                          Text(' • '),
                          Text('8 min read'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Just say anything, George, say whatever's natural, the first thing that comes to your mind. Take that you mutated son-of-a-bitch. My pine, why you. You space bastard, you killed a pine. You do? Yeah, it's 8:00. Hey, McFly, I thought I told you never",
                  style: TextStyle(
                    color: Color(0xFF19202D),
                    fontSize: 16,
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w500,
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