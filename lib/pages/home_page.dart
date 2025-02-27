import 'package:flutter/material.dart';
import 'package:flutter_exo1/components/bottom_nav_bar.dart';
import 'package:flutter_exo1/pages/favorite_page.dart';
import 'package:flutter_exo1/pages/profile_page.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      
      // drawer: Drawer(
      //   backgroundColor: Colors.grey[900],
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Column(children: [
      //         DrawerHeader(
      //         child: Image.asset(
      //           'assets/logo.png',
      //           color: Colors.white,
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(25.0),
      //         child: Divider(
      //           color: Colors.grey[800],
      //         ),
      //       ),
      //       const Padding(
      //         padding:  EdgeInsets.only(left: 25.0),
      //         child: ListTile(
      //           leading: Icon(
      //             Icons.home,
      //             color: Colors.white,
      //           ),
      //           title: Text(
      //             'Home',
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const Padding(
      //         padding:  EdgeInsets.only(left: 25.0),
      //         child: ListTile(
      //           leading: Icon(
      //             Icons.info,
      //             color: Colors.white,
      //           ),
      //           title: Text(
      //             'About',
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //       ],),
      //       const Padding(
      //         padding:  EdgeInsets.only(left: 25.0, bottom: 25.0,),
      //         child: ListTile(
      //           leading: Icon(
      //             Icons.logout,
      //             color: Colors.white,
      //           ),
      //           title: Text(
      //             'Logout',
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Flexible(child: _pages[_selectedIndex]),
    );
  }
}
