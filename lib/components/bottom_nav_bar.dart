import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int) ? onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5,),
      color: Colors.black,
      child: GNav(
        color: Colors.black,
        activeColor: Colors.white,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        gap: 2,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            iconActiveColor: Colors.red,
            iconColor: Colors.white,
            
          ),
          GButton(
            icon: Icons.shopping_cart,
            iconActiveColor: Colors.red,
            iconColor: Colors.white,
          ),
          GButton(
            icon: Icons.favorite,
            iconActiveColor: Colors.red,
            iconColor: Colors.white,
          ),
          GButton(
            icon: Icons.person,
            iconActiveColor: Colors.red,
            iconColor: Colors.white,
          ),
          
        ],
      ),
    );
  }
}
