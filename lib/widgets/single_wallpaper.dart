import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/screens/details.dart';

class SingleWallpaper extends StatelessWidget {
  const SingleWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("images").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              primary: false,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8),
              itemBuilder: (_, index) {
                final data = snapshot.data!.docs[index];

                return InkWell(
                  onTap: () {
                    Get.to(() => Details(data["img"]));
                  },
                  child: Hero(
                    tag: data["img"],
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.blue)),
                      child: CachedNetworkImage(
                        height: 100,
                        fit: BoxFit.cover,
                        imageUrl: data["img"],
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
