import 'package:flutter/material.dart';

class Special extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Special Events", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true
        ,
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
                "Exclusive Special Events",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Celebrate your special moments with our tailor-made events, ensuring unforgettable experiences.",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("asset/privatepeo.jpg", fit: BoxFit.cover),
              ),

              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("asset/privatelux.jpg", fit: BoxFit.cover),
              ),
               SizedBox(height: 20),
               ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("asset/privatetema.jpg", fit: BoxFit.cover),
              ),
               SizedBox(height: 20),
              Text(
                "Our Services",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text("Luxury & VIP Experiences", style: TextStyle(color: Colors.white)),
                subtitle: Text("Exclusive venues, premium service, and high-end experiences.", style: TextStyle(color: Colors.white70)),
              ),
              
             
              ListTile(
                leading: Icon(Icons.music_note, color: Colors.white),
                title: Text("Live Entertainment", style: TextStyle(color: Colors.white)),
                subtitle: Text("World-class performers, DJs, and shows tailored for your event.", style: TextStyle(color: Colors.white70)),
              ),
              ListTile(
                leading: Icon(Icons.celebration, color: Colors.white),
                title: Text("Theme Parties & Festivals", style: TextStyle(color: Colors.white)),
                subtitle: Text("Unique themed events for birthdays, anniversaries, and more.", style: TextStyle(color: Colors.white70)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                child: Text("Plan Your Special Event"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





