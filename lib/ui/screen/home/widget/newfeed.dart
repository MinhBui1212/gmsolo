import 'package:flutter/material.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({super.key});
  static int id = 0;

  @override
  State<NewFeed> createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {
  @override
  Widget build(BuildContext context) {
    return const Text('NewFeed');
  }
}
