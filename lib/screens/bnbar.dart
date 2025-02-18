// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class SocialEventsScreen extends StatefulWidget {
//   const SocialEventsScreen({super.key});

//   @override
//   State<SocialEventsScreen> createState() => _SocialEventsScreenState();
// }

// class _SocialEventsScreenState extends State<SocialEventsScreen> {
//   final List<String> socialEventTypes = [
//     'Birthdays',
//     'Anniversaries',
//     'Reunions',
//     // 'Parties',
//     'Ceremonies',
//     'Festivals'
//   ];

//   final List<Map<String, dynamic>> popularEvents = [
//     {
//       'title': 'Beach Party Night',
//       'image': 'assets/social/beach_party.jpg',
//       'date': '15 July 2024',
//       'location': 'Sunset Beach Club',
//       'price': '\$50'
//     },
//     {
//       'title': 'Mega DJ Night',
//       'image': 'assets/social/dj_night.jpg',
//       'date': '20 July 2024',
//       'location': 'City Arena',
//       'price': '\$75'
//     },
//     {
//       'title': 'Vintage Theme Party',
//       'image': 'assets/social/vintage_party.jpg',
//       'date': '25 July 2024',
//       'location': 'Grand Ballroom',
//       'price': '\$60'
//     },
//   ];

//   int _selectedCategory = 0;
//   double _currentSliderValue = 100;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header Section
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Social Events',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.search, color: Colors.white),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),

//               // Categories Filter Chips
//               SizedBox(
//                 height: 60,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: socialEventTypes.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: ChoiceChip(
//                         label: Text(
//                           socialEventTypes[index],
//                           style: TextStyle(
//                             color: _selectedCategory == index
//                                 ? Colors.black
//                                 : Colors.white,
//                           ),
//                         ),
//                         selected: _selectedCategory == index,
//                         selectedColor: Colors.tealAccent,
//                         backgroundColor: Colors.grey[800],
//                         onSelected: (bool selected) {
//                           setState(() {
//                             _selectedCategory = selected ? index : 0;
//                           });
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               // Featured Events Carousel
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 200,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   viewportFraction: 0.8,
//                 ),
//                 items: popularEvents.map((event) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                         margin: EdgeInsets.symmetric(horizontal: 4.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           image: DecorationImage(
//                             image: AssetImage(event['image']),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               bottom: 0,
//                               left: 0,
//                               right: 0,
//                               child: Container(
//                                 padding: EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(15),
//                                     bottomRight: Radius.circular(15),
//                                   ),
//                                   gradient: LinearGradient(
//                                     begin: Alignment.bottomCenter,
//                                     end: Alignment.topCenter,
//                                     colors: [
//                                       Colors.black.withOpacity(0.8),
//                                       Colors.transparent,
//                                     ],
//                                   ),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           event['title'],
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         SizedBox(height: 4),
//                                         Text(
//                                           event['date'],
//                                           style: TextStyle(
//                                             color: Colors.white70,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     CircleAvatar(
//                                       backgroundColor: Colors.tealAccent,
//                                       child: Text(
//                                         event['price'],
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),

//               // Popular Events Section
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Popular Social Gatherings',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               ...popularEvents.map((event) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 8.0),
//                   child: Card(
//                     color: Colors.grey[900],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(15),
//                             topRight: Radius.circular(15),
//                           ),
//                           child: Image.asset(
//                             event['image'],
//                             height: 150,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     event['title'],
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.location_on,
//                                           color: Colors.tealAccent, size: 16),
//                                       Text(
//                                         event['location'],
//                                         style: TextStyle(
//                                           color: Colors.white70,
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(Icons.star,
//                                       color: Colors.amber, size: 16),
//                                   Text(
//                                     '4.8',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(width: 8),
//                                   IconButton(
//                                     icon: Icon(Icons.favorite_border,
//                                         color: Colors.white),
//                                     onPressed: () {},
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         backgroundColor: Colors.tealAccent,
//         label: Text(
//           'Create Event',
//           style: TextStyle(color: Colors.black),
//         ),
//         icon: Icon(Icons.add, color: Colors.black),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomChoiceChipExample extends StatefulWidget {
  @override
  _CustomChoiceChipExampleState createState() => _CustomChoiceChipExampleState();
}

class _CustomChoiceChipExampleState extends State<CustomChoiceChipExample> {
  int _selectedIndex = 0;

  final List<String> _categories = ["Music", "Food", "Sports", "Tech", "Art"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom ChoiceChip")),
      body: Center(
        child: Wrap(
          spacing: 12,
          children: List.generate(_categories.length, (index) {
            return ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.event, // Custom icon
                    size: 18,
                    color: _selectedIndex == index ? Colors.white : Colors.black54,
                  ),
                  SizedBox(width: 5),
                  Text(_categories[index]),
                ],
              ),
              selected: _selectedIndex == index,
              onSelected: (bool selected) {
                setState(() {
                  _selectedIndex = selected ? index : _selectedIndex;
                });
              },
              selectedColor: Colors.blue, // Background when selected
              backgroundColor: Colors.grey[300], // Background when unselected
              labelStyle: TextStyle(
                color: _selectedIndex == index ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
                side: BorderSide(
                  color: _selectedIndex == index ? Colors.blue : Colors.grey, // Border color
                  width: 1.5,
                ),
              ),
              elevation: 5, // Add elevation effect
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjust size
            );
          }),
        ),
      ),
    );
  }
}
