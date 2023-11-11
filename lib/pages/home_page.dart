//Packages
import 'package:flutter/material.dart';
import 'package:peacenew/pages/group_chat_page_list.dart';

//Pages
import '../pages/chats_page.dart';
import '../pages/users_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _pages = [ChatsPage(), GroupsPage(), UsersPage()];

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: _currentPage,
        onTap: (_index) {
          setState(() {
            _currentPage = _index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(
              Icons.chat_bubble_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: "Group",
            icon: Icon(
              Icons.person_4_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "users",
            icon: Icon(
              Icons.supervised_user_circle_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
