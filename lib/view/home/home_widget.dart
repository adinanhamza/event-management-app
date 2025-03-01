  import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_managment/controller/vmfunctions.dart';
import 'package:event_managment/model/vendormodel.dart';
import 'package:event_managment/view/constants/constants.dart';
import 'package:event_managment/view/coporate/coporate.dart';
import 'package:event_managment/view/private/private.dart';
import 'package:event_managment/view/social/social.dart';
import 'package:event_managment/view/wedding/weddding.dart';
import 'package:event_managment/view/whislist/whislist.dart';
import 'package:flutter/material.dart';
Widget buildImageCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: AppConstants.homeBannerImages.map((path) => carouselitems(path)).toList(),
    );
  }
  Widget carouselitems(String imagepath){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        image: DecorationImage(image: 
        AssetImage(imagepath),
        fit: BoxFit.cover)
      ),
    );
  }

  PreferredSizeWidget buildappbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.appTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            AppConstants.appSubtitle,
            style: TextStyle(color: Colors.white60, fontSize: 14),
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              gotowishlist(context);
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            )),
        IconButton(
          icon: Stack(
            children: [
              Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
                size: 25,
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 14,
                      minWidth: 14,
                    ),
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
          onPressed: () {},
        )
      ],
    );
  }


  Widget buildVendorCard(vendormodel vendor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 19),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              vendor.imagepath!,
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Text(
              vendor.name!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              vendor.description!,
              style: const TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              onPressed: () => togglefavorite(vendor),
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  vendor.isfavorited ? Icons.favorite : Icons.favorite_border,
                  color: vendor.isfavorited ? Colors.red : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  gotowishlist(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Wishlist(),
      ),
    );
  }

Widget buildCategoriesSection(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            AppConstants.categoriesTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
buildCategoryCard(title: AppConstants.catCorporate, icon: Icons.business, onTap: () {
  navigateTo(Corporate(), context);
},),
buildCategoryCard(title: AppConstants.catSocial, icon: Icons.group, onTap: () {

  navigateTo(Social(), context);
},)
          ],
        ),
         const SizedBox(height: 20),
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
buildCategoryCard(title: AppConstants.catSpecial, icon: Icons.celebration, onTap: () {
  navigateTo(Private(), context);
},),
buildCategoryCard(title: AppConstants.catWedding, icon: Icons.web, onTap: () {

  navigateTo(Wedding(), context);
},)
          ],
        )
     
      ],
    );
  }



// Widget buildCategory(BuildContext context,
// String title,

// ) {

//         buildCategoryCard(
//           title: title,
//           icon: Icons.group,
//           onTap: () => navigateTo(Social(),context),
//         ),
//         buildCategoryCard(
//           title: title,
//           icon: Icons.business,
//           onTap: () => navigateTo(Corporate(),context),
//         ),
      
//   }

 void showFavoriteSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppConstants.addedfavorites),
        backgroundColor: Colors.white,
      ),
    );
  }
   void navigateTo(Widget page,BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

 Widget buildCategoryCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [Colors.white70, Colors.black],
            transform: GradientRotation(20),
        
        ),
      
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
     ) );
  }
   Widget buildPopularVendorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            AppConstants.popularVendorsTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppConstants.vendors.length,
          itemBuilder: (context, index) => 
              buildVendorCard(AppConstants.vendors[index]),
        ),
      ],
    );
  }
