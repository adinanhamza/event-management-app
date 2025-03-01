import 'package:event_managment/controller/vmfunctions.dart';
import 'package:event_managment/model/vendormodel.dart';
import 'package:event_managment/view/constants/constants.dart';

import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.black12,
      body: _buildFavoriteList(),
    );
  }

  // 🟢 **AppBar Widget**
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(wishlistConstants.wishlistTitle, style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }

  // 🟢 **Favorite List Widget**
  Widget _buildFavoriteList() {
    return ValueListenableBuilder<List<vendormodel>>(
      valueListenable: vendorlistnotifier,
      builder: (context, vendorList, child) {
        if (vendorList.isEmpty) {
          return const Center(
            child: Text(wishlistConstants.noFavoritesText, style: TextStyle(color: Colors.white)),
          );
        }
        return ListView.builder(
          itemCount: vendorList.length,
          itemBuilder: (context, index) {
            final vendor = vendorList[index];
            return _buildVendorCard(vendor, index);
          },
        );
      },
    );
  }

  // 🟢 **Vendor Card Widget**
  Widget _buildVendorCard(vendormodel vendor, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 19),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              vendor.imagepath!.isNotEmpty ? vendor.imagepath! : wishlistConstants.defaultImage,
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Text(
              vendor.name!,
              style: const TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              vendor.description!,
              style: const TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(
                vendor.isfavorited ? Icons.favorite : Icons.favorite_border_outlined,
                color: vendor.isfavorited ? Colors.red : Colors.black,
              ),
              onPressed: () async {
                deletefavorite(vendor, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
