import 'package:flutter/material.dart';

class Corporate extends StatelessWidget {
  const Corporate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Corporate Events', style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
           actions: [
          IconButton(onPressed: (){
      
          }, icon: Icon(Icons.my_library_add_outlined,color: Colors.white,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plan your next corporate event with us.',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'From business conferences to networking meets, we provide top-notch venues and services to make your event a success.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  corporateEventCard(
                    'Business Conference',
                    'asset/coporatebusinees.jpg',
                    'Host professional conferences with top-tier facilities.',
                  ),
                  corporateEventCard(
                    'Networking Meet',
                    'asset/coporatenet.jpeg',
                    'Engage and expand your business network in style.',
                  ),
                  corporateEventCard(
                    'Award Ceremonies',
                    'asset/coperate managmnt.jpg',
                    'Celebrate achievements with an elegant corporate setup.',
                  ),
                  corporateEventCard(
                    'Product Launch',
                    'asset/coporateproduct.jpg',
                    'Showcase your latest products with a stunning launch event.',
                  ),
                  corporateEventCard(
                    'Workshops & Seminars',
                    'asset/coporatework.jpeg',
                    'Conduct knowledge-sharing sessions with professionals.',
                  ),
                ],
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
            child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: 180,),
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
