import 'package:flutter/material.dart';
import 'package:grocery_app/pages/header_part.dart';
import 'package:grocery_app/pages/items_display.dart';
import 'package:grocery_app/utils/colors.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          //for header part 
          SizedBox(height: 10),
          HeaderParts(),
          //for Body parts
          ItemsDisplay(),
          
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          selectedItemColor: primaryColors,
          unselectedItemColor: Colors.green[200],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), 
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat), 
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), 
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications), 
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite), 
              label: 'Favorite',
            ),
          ]
      ),
    );
  }
}
