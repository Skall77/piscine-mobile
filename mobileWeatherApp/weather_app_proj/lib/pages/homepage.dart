import 'package:flutter/material.dart';
import 'package:weather_app_proj/pages/currently.dart';
import 'package:weather_app_proj/pages/today.dart';
import 'package:weather_app_proj/pages/weekly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _input = '';
  bool _geo = false;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search location...',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
                onChanged: (value) {
                  setState(() {
                    _input = value;
                    _geo = false;
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.location_on, color: Colors.white),
              onPressed: () {
                setState(() {
                  _geo = !_geo;
                  _input = '';
                });
              },
            )
          ]
        )
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          CurrentlyPage(input: _input, geo: _geo),
          TodayPage(input: _input, geo: _geo),
          WeeklyPage(input: _input, geo: _geo),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Currently',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Weekly',
          ),
        ],
      ),
    );
  }
}