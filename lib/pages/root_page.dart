// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_project_2/providers/app_provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          body: Center(
            child: provider.pages.elementAt(provider.selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.selectedIndex,
            onTap: (index) {
              provider.selectedIndex = index;
              provider.notifyListeners();
            },
            showSelectedLabels: false,
            backgroundColor: Colors.white,
            showUnselectedLabels: false,
            selectedItemColor: Colors.green,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
