import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourinsta/models/user.dart';
import 'package:yourinsta/providers/user_provider.dart';
import 'package:yourinsta/utils.dart/colors.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  //UserModel user=Provider.of<UserProvider>(context).getUser;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      body: Text("Hiiiiiishani"),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Add",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Liked"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "people"),
        ],
      ),
    );
  }
}
