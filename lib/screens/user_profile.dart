import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileHeader(),
            SizedBox(height: 20),
            Text(
              'Every piece of chocolate I ever ate is getting back\nat me.. desserts are very revengeful..',
              style: TextStyle(
                color: Color(0xFF9397A0),
                fontSize: 12,
                fontFamily: 'Gellix',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            SizedBox(height: 33),
            StatisticsContainer(),
            SizedBox(height: 30),
            SectionTitle("Elly's Post"),
            SizedBox(height: 10),
            Expanded(
              child: NewsArticleList(),
            ),
            SizedBox(height: 30),
            SectionTitle("Popular From Elly"),
            SizedBox(height: 20),
            ImageCarousel(),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
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
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                'Elly Byers',
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
                'Author & Writer',
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
          StatisticItem('54.21k', 'Followers'),
          CustomDivider(), // Use the custom divider
          StatisticItem('54.21k', 'Posts'),
          CustomDivider(), // Use the custom divider
          StatisticItem('54.21k', 'Following'),
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
          ArticleText(),
        ],
      ),
    );
  }
}

class NewsArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          NewsArticleItem(),
          SizedBox(height: 15),
          NewsArticleItem(),
          SizedBox(height: 15),
          NewsArticleItem(),
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
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class ArticleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          "News: Theme",
          style: TextStyle(
            color: Color(0xFF9397A0),
            fontSize: 10,
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Fifth Iranian paramilitary me...\nFifth Iranian paramilitary me...',
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
              color: Colors.grey,
            ),
            SizedBox(width: 5),
            Text("16th May"),
            SizedBox(width: 40),
            Container(
              width: 16,
              height: 16,
              color: Colors.grey,
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
      color: Colors.grey,
    );
  }
}
