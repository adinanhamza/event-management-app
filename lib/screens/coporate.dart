import 'package:flutter/material.dart';
import 'constants.dart';


class Corporate extends StatelessWidget {
  const Corporate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(CorporateEventConstants.appBarTitle, 
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.arrow_back, color: Colors.white)
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.my_library_add_outlined, color: Colors.white)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CorporateEventConstants.pageHeading,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              CorporateEventConstants.pageSubheading,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: CorporateEventConstants.eventsList.length,
                itemBuilder: (context, index) {
                  final event = CorporateEventConstants.eventsList[index];
                  return corporateEventCard(event.title, event.imagePath, event.description);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget corporateEventCard(String title, String imagePath, String description) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: 180),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}