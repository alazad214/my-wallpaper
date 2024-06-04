import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class Details extends StatelessWidget {
  String imgUrl;
  Details(this.imgUrl, {super.key});
  setWallpaperHomeScreen(url) async {
    try {
      int location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      await WallpaperManager.setWallpaperFromFile(file.path, location);
      Fluttertoast.showToast(msg: 'set successfully');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed');
    }
  }

  setWallpaperLockScreen(url) async {
    try {
      int location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      await WallpaperManager.setWallpaperFromFile(file.path, location);
      Fluttertoast.showToast(msg: 'set successfully');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed');
    }
  }

  shareImage(url) {
    Share.share(
      url,
    );
  }

  downloadImage(url) async {
    try {
      // Request storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        var imageId = await ImageDownloader.downloadImage(url);
        if (imageId == null) {
          Fluttertoast.showToast(msg: 'Failed to download image');
          return;
        }
        var path = await ImageDownloader.findPath(imageId);
        Fluttertoast.showToast(msg: 'Downloaded to $path');
      } else {
        Fluttertoast.showToast(msg: 'Permission denied');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to download image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        openBackgroundColor: Colors.green,
        labelsBackgroundColor: Colors.greenAccent,
        labelsStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        speedDialChildren: [
          SpeedDialChild(
            child: const Icon(
              Icons.wallpaper,
              size: 18,
            ),
            label: 'Set Homescreen',
            onPressed: () => setWallpaperHomeScreen(imgUrl),
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.lock,
              size: 18,
            ),
            label: 'Set Lockscreen',
            onPressed: () => setWallpaperLockScreen(imgUrl),
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.cloud_download,
              size: 18,
            ),
            label: 'Download',
            onPressed: () => downloadImage(imgUrl),
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.share,
              size: 18,
            ),
            label: 'Share',
            onPressed: () => shareImage(imgUrl),
          ),
        ],
        child: const Icon(
          Icons.add_circle_outline_outlined,
        ),
      ),
      body: Hero(
        tag: imgUrl,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          alignment: Alignment.topLeft,
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.blue,
              )),
        ),
      ),
    );
  }
}
