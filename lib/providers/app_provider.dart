import 'package:flutter/material.dart';

import '../pages/category_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class AppProvider with ChangeNotifier {
  int selectedIndex = 0;
  
  final List<Widget> pages = const [
    HomePage(),
    CategoryPage(),
    ProfilePage(),
  ];
}
