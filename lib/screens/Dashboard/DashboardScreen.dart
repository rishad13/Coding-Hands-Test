import 'package:flutter/material.dart';
import 'home/homeScreen.dart';
import 'widgets/CustombottomNavigationBar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: _pageController,
            children: const [
              HomeScreen(),
              Center(child: Text('Search')),
              Center(child: Text('Orders')),
              Center(child: Text('More')),
            ],
            onPageChanged: (int page) {
              setState(() {
                _currentIndex = page;
              });
            }),
        bottomNavigationBar: CustomBottomNavigationBar(
          index: _currentIndex,
          onPressed: ({required value}) {
            _onItemTapped(value);
          },
        ));
  }
}
