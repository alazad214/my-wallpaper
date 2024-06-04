import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
                  child: Container(
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.asset("assets/images/wallpaper.png"),
          ))),
          const SizedBox(height: 10),
          customListtile(
            Icons.home,
            "H O M E",
            () {
              Navigator.pop(context);
            },
          ),
          customListtile(
            Icons.home,
            "F A V A U R I T E",
            () {
              Navigator.pop(context);
            },
          ),
          customListtile(
            Icons.settings,
            "S E T T I N G S",
            () {
              Navigator.pop(context);
            },
          ),
          customListtile(
            Icons.policy,
            "P O L I C Y",
            () {
              Navigator.pop(context);
            },
          ),
          customListtile(
            Icons.person,
            "D E V E L O P E R",
            () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

Widget customListtile(icon, text, ontap) {
  return InkWell(
    onTap: ontap,
    child: ListTile(
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.blueGrey,
          )),
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  );
}
