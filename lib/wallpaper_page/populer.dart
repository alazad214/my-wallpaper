import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/details.dart';

class Populer extends StatelessWidget {
  const Populer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: StreamBuilder(
            stream:
            FirebaseFirestore.instance.collection("populer").snapshots(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.9),
                  itemBuilder: (_, index) {
                    final data = snapshot.data!.docs[index];

                    return InkWell(
                      onTap: () {
                        Get.to(() => Details(data["img"]));
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                    );
                  });
            }),
      ),
    );
  }
}
