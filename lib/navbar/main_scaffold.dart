import 'package:flutter/material.dart';
import 'package:sixers/views/create_league/create_league_screen.dart';
import 'package:sixers/views/home/draft_screen.dart';
import 'package:sixers/views/home/home_screen.dart';
import 'navbar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _index = 0;

  final List<Widget> _pages = const [HomeScreen(), DraftScreen(), CreateLeagueScreen()];

  void _onTabTapped(int newIndex) {
    setState(() => _index = newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavBar(currentIndex: _index, onTap: _onTabTapped),
    );
  }
}
