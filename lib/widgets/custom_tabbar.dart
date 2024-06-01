import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../wallpaper_page/animals.dart';
import '../wallpaper_page/latest.dart';
import '../wallpaper_page/nature_wallpaper.dart';
import '../wallpaper_page/populer.dart';
import '../wallpaper_page/programming.dart';
import '../wallpaper_page/status.dart';
import '../wallpaper_page/tranding.dart';

class CustomTabbar extends StatefulWidget {
  CustomTabbar({
    super.key,
  });

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> pages = [
    Tranding(),
    Populer(),
    Latest(),
    Status(),
    Islamic(),
    Programming(),
    Nature(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.blue,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.grey,
              tabAlignment: TabAlignment.start,
              labelStyle: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              controller: tabController,
              tabs: const [
                Tab(
                  text: "Tranding",
                ),
                Tab(
                  text: "Populer",
                ),
                Tab(
                  text: "Latest",
                ),
                Tab(
                  text: "Status",
                ),
                Tab(
                  text: "Islamic",
                ),
                Tab(
                  text: "Programming",
                ),
                Tab(
                  text: "Nature",
                ),
              ]),
        ),
        SizedBox(
          height: h / 1,
          child: TabBarView(
            controller: tabController,
            children: pages,
          ),
        )
      ],
    );
  }
}
