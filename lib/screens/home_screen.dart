import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/drawer.dart';
import 'package:wallpaper/widgets/single_wallpaper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "WP214",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          titleSpacing: 0,
          backgroundColor: Colors.lightBlueAccent.withOpacity(0.4)),
      drawer: const CustomDrawer(),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [SingleWallpaper()],
            ),
          ),
        ),
      ),
    );
  }
}
