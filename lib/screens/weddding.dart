import 'package:flutter/material.dart';

class Wedding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Wedding Events",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        
        iconTheme: IconThemeData(color: Colors.white),
           actions: [
          IconButton(onPressed: (){
      
          }, icon: Icon(Icons.my_library_add_outlined,color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Dream Wedding Awaits",
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Experience a once-in-a-lifetime event with exquisite venues, stunning decorations, and world-class catering. Let us make your wedding truly magical.",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 20),
              wedography('asset/mrgfuntione.jpg'),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(12),
              //   child: Image.asset(
              //     'asset/mrgfuntione.jpg',
              //     width: double.infinity,
              //     height: 200,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              SizedBox(height: 20),
              Text(
                "Exclusive Wedding Services",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  weddingServiceItem("Luxury Venues", "Choose from breathtaking locations to celebrate your big day."),
                   SizedBox(height: 5),
             wedography('asset/weddingluxuryven.jpeg'),
             SizedBox(height: 20),
                  weddingServiceItem("Catering & Cuisine", "Enjoy a customized menu tailored to your preferences."),
                  SizedBox(height: 5),
              wedography( 'asset/weddingcater.jpg'),
              SizedBox(height: 20),
                  weddingServiceItem("Professional Photography", "Capture every precious moment with our expert photographers."),
                  SizedBox(height: 5),
                  wedography('asset/handevnt.jpg'),
                    SizedBox(height: 20),
                  weddingServiceItem("Stunning Decorations", "Transform your venue into a dream setting with elegant decor."),
                   SizedBox(height: 5),
                   wedography('asset/weddingstunning.webp'),
                    SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget weddingServiceItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.white, size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
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
 
 Widget wedography(String imagepath){
  return  ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                imagepath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              );
 }
}
