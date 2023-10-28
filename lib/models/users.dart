import 'models.dart';

class SampleData {
  static User user1 = User(
    profilePicture: 'assets/profile.png',
    firstName: 'John',
    lastName: 'Doe',
    work: 'Travel & Blogger',
    bio: 'Exploring the world, one destination at a time.',
    followers: '12.3k',
    posts: '245',
    following: '134',
    postsList: [
      Post(
        photo: 'assets/post1.png',
        theme: 'Adventure',
        title: 'Hiking in the Andes',
        day: '15',
        month: 'October',
        year: '2023',
        time: '09:45 AM',
        content: 'Amazing hike through the Andes mountains.',
      ),
      Post(
        photo: 'assets/post1.png',
        theme: '2Adventure',
        title: '2Hiking in the Andes',
        day: '15',
        month: 'October',
        year: '2023',
        time: '09:45 AM',
        content: '2Amazing hike through the Andes mountains.',
      ),
      Post(
        photo: 'assets/post1.png',
        theme: '3Adventure',
        title: '3Hiking in the Andes',
        day: '15',
        month: 'October',
        year: '2023',
        time: '09:45 AM',
        content: '3Amazing hike through the Andes mountains.',
      ),
      // Add more posts here if needed
    ],
    featuredList: [
      Featured(photo: 'assets/post1.png'),
      Featured(photo: 'assets/post1.png'),
      Featured(photo: 'assets/post1.png'),
      // Add more featured items here if needed
    ],
  );

  static User user2 = User(
    profilePicture: 'assets/profile.png',
    firstName: 'Alice',
    lastName: 'Smith',
    work: 'Foodie and Traveler',
    bio: 'Exploring new cuisines and cultures.',
    followers: '8.7k',
    posts: '189',
    following: '99',
    postsList: [
      Post(
        photo: 'assets/post1.png',
        theme: 'Food',
        title: 'Street Food Adventure',
        day: '20',
        month: 'May',
        year: '2023',
        time: '03:30 PM',
        content: 'Tasting delicious street food in Bangkok.',
      ),
      Post(
        photo: 'assets/post1.png',
        theme: 'Food',
        title: 'Street Food Adventure',
        day: '20',
        month: 'May',
        year: '2023',
        time: '03:30 PM',
        content: 'Tasting delicious street food in Bangkok.',
      ),
      Post(
        photo: 'assets/post1.png',
        theme: 'Food',
        title: 'Street Food Adventure',
        day: '20',
        month: 'May',
        year: '2023',
        time: '03:30 PM',
        content: 'Tasting delicious street food in Bangkok.',
      ),
      // Add more posts here if needed
    ],
    featuredList: [
      Featured(photo: 'assets/post1.png'),
      Featured(photo: 'assets/post1.png'),
      Featured(photo: 'assets/post1.png'),
      // Add more featured items here if needed
    ],
  );

  static User user3 = User(
    profilePicture: 'assets/profile.png',
    firstName: 'Linda',
    lastName: 'Johns',
    work: 'Photographer',
    bio: 'Capturing the beauty of the world.',
    followers: '14.5k',
    posts: '302',
    following: '178',
    postsList: [
      Post(
        photo: 'assets/post1.png',
        theme: 'Photography',
        title: 'Sunset in Santorini',
        day: '10',
        month: 'August',
        year: '2023',
        time: '07:15 PM',
        content: 'Photographing a stunning sunset in Santorini.',
      ),
      Post(
        photo: 'assets/post1.png',
        theme: 'Photography',
        title: 'Sunset in Santorini',
        day: '10',
        month: 'August',
        year: '2023',
        time: '07:15 PM',
        content: 'Photographing a stunning sunset in Santorini.',
      ),
      Post(
        photo: 'assets/post1.png',
        theme: 'Photography',
        title: 'Sunset in Santorini',
        day: '10',
        month: 'August',
        year: '2023',
        time: '07:15 PM',
        content: 'Photographing a stunning sunset in Santorini.',
      ),
      // Add more posts here if needed
    ],
    featuredList: [
      Featured(photo: 'assets/post1.png.'),
      Featured(photo: 'assets/post1.png.'),
      Featured(photo: 'assets/post1.png.'),
      // Add more featured items here if needed
    ],
  );
}
