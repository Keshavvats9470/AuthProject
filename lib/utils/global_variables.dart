import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_socioapp/screens/add_post_screen.dart';
import 'package:project_socioapp/screens/profile_screen.dart';
import 'package:project_socioapp/screens/search_screen.dart';

import 'package:project_socioapp/screens/feed_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('Notification'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
