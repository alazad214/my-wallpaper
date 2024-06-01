import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper_page/animals.dart';
import 'package:wallpaper/wallpaper_page/latest.dart';
import 'package:wallpaper/wallpaper_page/nature_wallpaper.dart';
import 'package:wallpaper/wallpaper_page/populer.dart';
import 'package:wallpaper/wallpaper_page/programming.dart';
import 'package:wallpaper/wallpaper_page/status.dart';
import 'package:wallpaper/wallpaper_page/tranding.dart';
import 'package:wallpaper/widgets/custom_tabbar.dart';
import 'package:wallpaper/widgets/drawer.dart';
import 'package:wallpaper/widgets/single_wallpaper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TabController tabController;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "Most Favourite",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SingleWallpaper(),
                CustomTabbar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
