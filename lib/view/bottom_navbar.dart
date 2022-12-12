import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subway_app/view/homepage.dart';
import 'package:subway_app/view/account.dart';
import 'package:subway_app/view/about.dart';
import 'package:subway_app/view/signup.dart';

class Navbar extends StatefulWidget {
  String str = "";
  Navbar({Key? key, required this.str}) : super(key: key);
  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Home(str: widget.str),
      About(),
      Account(str: widget.str),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(0, 137, 56, 1),
        onTap: _onItemTapped,
      ),
      // body: _children[currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      //   unselectedItemColor: Colors.grey,
      //   backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //   unselectedFontSize: 14,
      //   selectedItemColor: Color.fromRGBO(0, 137, 56, 1),
      //   type: BottomNavigationBarType.fixed,
      //   onTap: onTabTapped,
      //   items: const [
      //     BottomNavigationBarItem(
      //       //I want to navigate to a new page Library();
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       //I want to navigate to a new page Store();
      //       icon: Icon(
      //         Icons.read_more,
      //       ),
      //       label: 'About',
      //     ),
      //     BottomNavigationBarItem(
      //       //I want to navigate to a new page Profile();
      //       icon: Icon(
      //         Icons.account_circle,
      //       ),
      //       label: 'Account',
      //     ),
      //   ],
      // ),
    );
  }
}
