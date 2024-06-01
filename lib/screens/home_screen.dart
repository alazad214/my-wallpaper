import 'package:flutter/material.dart';
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
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "Most Favourite",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SingleWallpaper(),
                SizedBox(height: 20,),
                CustomTabbar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
