// import 'package:event_managment/screens/coporate.dart';
// import 'package:event_managment/screens/weddding.dart';
// import 'package:flutter/material.dart';
// import 'package:event_managment/screens/account.dart';
// import 'package:event_managment/screens/booking.dart';
// import 'package:event_managment/screens/constants.dart';
// import 'package:event_managment/screens/listevent.dart';
// import 'package:event_managment/screens/private.dart';
// import 'package:event_managment/screens/social.dart';


// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   int _selectedIndex = 0;

//   late final List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       Homescreen(),
//       Bookingscreen(),
//       Listevent(),
//       Account(),
//     ];
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black12,
//         body: _selectedIndex == 0 ? _buildHomePage() : _pages[_selectedIndex],
//         bottomNavigationBar: _buildBottomNavBar(),
//         appBar: _buildAppBar(),
//       ),
//     );
//   }

//   Widget _buildHomePage() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 20),
//         buildSearchBar(),
//            SizedBox(height: 20),
//           buildHeroSection(),
//           const SizedBox(height: 25),
//           buildCategoriesSection(),
//           const SizedBox(height: 25),
//           _buildPopularVendorsSection(),
//         ],
//       ),
//     );
//   }

//   // ✅ Hero Section (Banner Image)
//   Widget _buildHeroSection() {
//     return Stack(
//       children: [
//         Image.asset(
//           AppConstants.homebannerimages[0], // Uses first banner image
//           width: double.infinity,
//           height: 200,
//           fit: BoxFit.cover,
//         ),
//         const Positioned(
//           bottom: 20,
//           left: 20,
//           child: Text(
//             "Create Unforgettable Moments",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // ✅ Categories Section
//   Widget _buildCategoriesSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Text(AppConstants.categoriestitile,
//               style: TextStyle(color: Colors.white, fontSize: 22)),
//         ),
//         const SizedBox(height: 20),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: AppConstants.categoriestitile.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Two items per row
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 2.5,
//           ),
//           itemBuilder: (context, index) {
//             final category = AppConstants.categories[index];
//             return _buildCategoryCard(
//               title: category['title'],
//               icon: category['icon'],
//               onTap: () {
//                 if (category['title'] == 'Social') {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Social()));
//                 } else if (category['title'] == 'Corporate') {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Corporate()));
//                 } else if (category['title'] == 'Private') {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Private()));
//                 } else if (category['title'] == 'Wedding') {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Wedding()));
//                 }
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }

//   // ✅ Category Card
//   Widget _buildCategoryCard({
//     required String title,
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 100,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white70, Colors.black],
//             transform: GradientRotation(20),
//           ),
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: Colors.white, size: 30),
//             const SizedBox(height: 10),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ✅ Popular Vendors Section
//   Widget _buildPopularVendorsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(10),
//           child: Text(
//             AppConstants.popularVendorsTitle,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 22,
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: AppConstants.vendors.length,
//           itemBuilder: (context, index) {
//             final vendor = AppConstants.vendors[index];
//             return _buildVendorCard(vendor);
//           },
//         ),
//       ],
//     );
//   }

//   // ✅ Vendor Card
//   Widget _buildVendorCard(Map<String, String> vendor) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
//             child: Image.asset(
//               vendor['imagePath']!,
//               height: 250,
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//           ),
//           ListTile(
//             contentPadding: const EdgeInsets.all(10),
//             title: Text(
//               vendor['name']!,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 19,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             subtitle: Text(
//               vendor['description']!,
//               style: const TextStyle(color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ Bottom Navigation Bar
//   Widget _buildBottomNavBar() {
//     return BottomNavigationBar(
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped,
//       type: BottomNavigationBarType.fixed,
//       items: List.generate(
//         AppConstants.bottomNavLabels.length,
//         (index) => BottomNavigationBarItem(
//           icon: Icon(
//             index == 0
//                 ? Icons.home
//                 : index == 1
//                     ? Icons.add_circle_outlined
//                     : index == 2
//                         ? Icons.event_available_outlined
//                         : Icons.person,
//           ),
//           label: AppConstants.bottomNavLabels[index],
//         ),
//       ),
//       selectedItemColor: Colors.blueAccent,
//       unselectedItemColor: Colors.white60,
//       backgroundColor: Colors.black,
//     );
//   }

//   // ✅ App Bar
//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       title: const Text(AppConstants.appTitle, style: TextStyle(color: Colors.white)),
//       actions: [
//         IconButton(onPressed: () {}, icon: const Icon(Icons.favorite, color: Colors.white)),
//         IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.white)),
//       ],
//     );
//   }
// }
