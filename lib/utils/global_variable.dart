import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_prac/screens/add_post.dart';
import 'package:social_prac/screens/feed_screen.dart';
import 'package:social_prac/screens/search_screen.dart';

import '../screens/profile_screen.dart';

const webScreenSize = 600;
List<Widget> homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  // Text('interactions'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
