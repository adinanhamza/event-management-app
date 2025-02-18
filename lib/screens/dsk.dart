// // // Add these variables in your state class
// // String search = '';
// // List<eventmodel> searched = [];
// // final TextEditingController _searchController = TextEditingController();



// // // Add this helper method to build list items
// // Widget _buildEventItem(eventmodel data) {
// //   return ListTile(
// //     title: Text(
// //       data.name ?? 'No Name',
// //       style: TextStyle(color: Colors.white),
// //     ),
// //     subtitle: Text(
// //       '${data.venue} • ${data.location}',
// //       style: TextStyle(color: Colors.white70),
// //     ),
// //     leading: CircleAvatar(
// //       backgroundImage: data.eimage.isNotEmpty
// //           ? FileImage(File(data.eimage))
// //           : AssetImage('asset/placeholder.png') as ImageProvider,
// //     ),
// //     onTap: () {
// //       // Navigate to details screen
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => Details(
// //             name: data.name,
// //             phone: data.phone,
// //             email: data.email,
// //             date: data.date,
// //             venue: data.venue,
// //             location: data.location,
// //             index: data.index,
// //             eimage: data.eimage,
// //           ),
// //         ),
// //       );
// //     },
// //   );
// // }

// // // Your existing search function modified for null safety
// // void searchListNew() {
// //   searched = eventlistnotifier.value.where((event) {
// //     final name = event.name?.toLowerCase() ?? '';
// //     final venue = event.venue?.toLowerCase() ?? '';
// //     final location = event.location?.toLowerCase() ?? '';
// //     final searchLower = search.toLowerCase();
    
// //     return name.contains(searchLower) ||
// //            venue.contains(searchLower) ||
// //            location.contains(searchLower);
// //   }).toList();
// // }

// // // Don't forget to dispose the controller
// // @override
// // void dispose() {
// //   _searchController.dispose();
// //   super.dispose();
// // }



// Expanded( // Wrap Column in Expanded
//   child: Column(
//     children: [
//       SizedBox(height: 20),
//       Container(
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: Color.fromRGBO(255, 255, 255, 0.1),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: TextField(
//           controller: searchcontroller,
//           onChanged: (value) {
//             setState(() {
//               search = value;
//               searchListNew();
//             });
//           },
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: 'Search events, venues, or vendors...',
//             prefixIcon: Icon(Icons.search, color: Colors.white),
//             hintStyle: TextStyle(color: Colors.white60),
//             border: InputBorder.none,
//             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             suffixIcon: search.isNotEmpty
//                 ? IconButton(
//                     icon: Icon(Icons.clear, color: Colors.white),
//                     onPressed: () {
//                       searchcontroller.clear();
//                       setState(() {
//                         search = '';
//                         searched.clear();
//                       });
//                     },
//                   )
//                 : null,
//           ),
//         ),
//       ),

//       /// 🔹 **Fix: Use Expanded Instead of Flexible**
//       Expanded( // Ensures ListView gets proper height
//         child: search.isEmpty
//             ? ValueListenableBuilder<List<eventmodel>>(
//                 valueListenable: eventlistnotifier,
//                 builder: (context, eventItem, child) {
//                   return ListView.builder(
//                     itemCount: eventItem.length,
//                     itemBuilder: (context, index) {
//                       final data = eventItem[index];
//                       return _buildHomePage(data);
//                     },
//                   );
//                 },
//               )
//             : searched.isEmpty
//                 ? Center(
//                     child: Text(
//                       'No results found',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: searched.length,
//                     itemBuilder: (context, index) {
//                       final data = searched[index];
//                       return _buildHomePage(data);
//                     },
//                   ),
//       ),
//     ],
//   ),
// ),
