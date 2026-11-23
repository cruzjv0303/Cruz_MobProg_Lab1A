import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

// The newsfeed: a list of two posts.
// TODO: Post 1 is YOUR post. Replace 'Your Name' with your own name
// and write your own post text.
// TODO: Post 2 is by a CLASSMATE you pick. Replace "Classmate's Name"
// with their name and write their post text.

class Post {
  Post({
    required this.authorName,
    required this.date,
    required this.text,
    required this.likes,
    this.avatarAsset,
    this.imageAsset,
  });

  final String authorName;
  final String date;
  final String text;
  int likes;
  final String? imageAsset;
  final String? avatarAsset;
}

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final List<Post> _posts = [
    Post(
      authorName: 'John Joseph Cruz',
      date: 'November 23, 2026',
      text: 'Hello to my million fans around the world!',
      likes: 999,
      avatarAsset: 'assets/images/jay_avatar.png',
      imageAsset: null,
    ),
    Post(
      authorName: "Bryannica Nepomuceno",
      date: 'November 22, 2026',
      text: 'init much!',
      likes: 200,
      avatarAsset: 'assets/images/bry_avatar.png',
      imageAsset: 'assets/images/bry_post.png',
    ),
  ];

  void _likePost(int index) {
    setState(() {
      _posts[index].likes += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          authorName: post.authorName,
          date: post.date,
          text: post.text,
          likes: post.likes,
          avatarAsset: post.avatarAsset,
          imageAsset: post.imageAsset,
          onLike: () => _likePost(index),
        );
      },
    );
  }
}
