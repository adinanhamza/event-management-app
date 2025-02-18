




import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/functions/vmfunctions.dart';

import 'package:event_managment/model/model.dart';
import 'package:event_managment/model/vendormodel.dart';
import 'package:event_managment/screens/account.dart';
import 'package:event_managment/screens/coporate.dart';
import 'package:event_managment/screens/bookingscreen.dart';
import 'package:event_managment/screens/details.dart';
import 'package:event_managment/screens/listevent.dart';
import 'package:event_managment/screens/social.dart';
import 'package:event_managment/screens/private.dart';
import 'package:event_managment/screens/weddding.dart';
import 'package:event_managment/screens/whislist.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String search = '';
  List <eventmodel> searched = [];
  double ratings = 4.4;
  int reviews = 132;
  
  




final TextEditingController searchcontroller = TextEditingController();

late final List<Widget> _pages;

  int _selectedIndex = 0; // Current index 

  // Screens  BottomNavigationBar 
 void initState() {
  super.initState();
  _pages = [ // ✅ Initialize in `initState()`
  Homescreen(),
    Bookingscreen(),
    Listevent(),
    Account(),
  ];
}
List <vendormodel> vendors = [
  
  vendormodel(id: '1', name: 'Destination weddings', description: 'destination function', imagepath: 'asset/beachwe.webp'),
  vendormodel(id: '2', name:'Bluewind Blogs', description: 'photography & videography', imagepath:  'asset/mrgb&w.jpg'),
  vendormodel(id: '3', name:'Co-Op Event' , description:  'Coperate program', imagepath:'asset/eventcontroller.jpg'),
vendormodel(id: '4', name: 'Decor Premium', description: 'decoration arts', imagepath: 'asset/night eve.webp'),
vendormodel(id: '5', name:'Vench Events', description: 'premium events', imagepath:'asset/decor 1.webp',)
];

//  Future <void> togglefavoriteinh(vendormodel vendor)async {
//   setState(() {
//     vendors = vendors.map((ven) {
//       if (ven.id == vendor.id) {
//         return vendormodel(
//           id: ven.id,
//           name: ven.name,
//           description: ven.description,
//           imagepath: ven.imagepath,
//           isfavorited: !ven.isfavorited, // ✅ Properly updates the object
//         );
//       }
//    final  vendordata =   vendormodel(id: ven.id, name: ven.name, description: ven.description, imagepath: ven.imagepath,isfavorited: true);
//    togglefavorite(vendordata);
//       return ven;
      
//     }).toList();
//   });

 
// }
  List imagelist = [
    'asset/aessthedining.jpeg',
    'asset/caterngser.webp',
    'asset/diningarea.jpg',
    'asset/mrginvita.jpg',
    'asset/cakeevents.jpg',
    'asset/mrgfuntione.jpg',
    'asset/traditionalevents.webp',
    'asset/American-Express-Orana-food.jpg'
  ];
// List vendorslist = [
//   'asset/beachwe.webp',
//   'asset/mrgb&w.jpg',
//   'asset/eventcontroller.jpg',
//   'asset/night eve.webp',
//   'asset/daytimeevent.jpeg'
// ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  void searchListNew() {
    searched = eventlistnotifier.value
        .where((smodel) =>
            smodel.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
  @override
 

  Widget build(BuildContext context) {
 

 getallfavoritevendors();
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.black12,
        
        body: _selectedIndex == 0 ? _buildHomePage(widget) : _pages[_selectedIndex],

        // BottomNavigationBar
        bottomNavigationBar:     BottomNavigationBar  (
          currentIndex: _selectedIndex, // Active tab index
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
           // Handle tab changes
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outlined),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
               icon:Icon(Icons.event_available_outlined),
              label: 'Events'
            ),
            BottomNavigationBarItem(
            
               icon: Icon(Icons.person),
              label: 'Profile',
               )
          ],
          selectedItemColor: Colors.blueAccent, 
          unselectedItemColor: Colors.white60, 
          backgroundColor: Colors.black, 
        ),
appBar: buildappbar(),

      ),
    );
  }

        Widget _buildHomePage (data){
        
   return      SingleChildScrollView(
          child: Column(
            children: [
                SizedBox(height: 20,),
   
              buildsearchbar(),
   
              SizedBox(height: 20),
              
             
            
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true, 
                  enlargeCenterPage: true, 
                  enableInfiniteScroll: true, 
                  autoPlayInterval: Duration(seconds: 3), // Time interval for auto-scroll
                  onPageChanged: (index, reason) {
                    // print("Current page index: $index");
                  },
                ),
                items: imagelist.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  // Catogories
                  Text('Categories',style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 25,
                  ),),
                ],
              ),
              SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Social()));
                },
                child: Container(
                  height: 100,
                  width: 180,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    gradient: LinearGradient(colors: [Colors.white70,Colors.black],transform: GradientRotation(20)),
                
                    borderRadius: BorderRadius.circular(18)
                  ),
                  child:  Column(
                      children: [
                         SizedBox(height: 10,),
                          Icon(Icons.group,color: Colors.white,size: 30,),
                          SizedBox(height: 10,),
                          Text('SOCIAL',style: TextStyle(
                            fontSize: 20,
                             fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white
                          ),)
                      ],
                    ),
                ),
              ),
               InkWell(
             onTap: () {
               Navigator.push(context, (MaterialPageRoute(builder: (context)=> Corporate())));
             },
             child: Container(
               height: 100,
               width: 180,
               decoration: BoxDecoration(
                 // color: const Color.fromARGB(255, 174, 58, 8),
                 gradient: LinearGradient(colors: [Colors.white70,Colors.black],transform: GradientRotation(20)),
                  borderRadius: BorderRadius.circular(18)
               ),
               child:  Column(
                   children: [
                      SizedBox(height: 10,),
                       Icon(Icons.business,color: Colors.white,size: 30,),
                       SizedBox(height: 10,),
                       Text('COPERATE',style: TextStyle(
                         fontSize: 20,
                          fontWeight: FontWeight.bold,
                         fontStyle: FontStyle.normal,
                         color: Colors.white
                       ),)
                   ],
                 ),
             ),
           ),
            ],
          ),
            SizedBox(height: 20,),
          
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               InkWell(
                 onTap: () {
                   Navigator.push(context,(MaterialPageRoute(builder: (context)=> Special())) );
                 },
                 child: Container(
                   height: 100,
                   width: 180,
                   decoration: BoxDecoration(
                     // color: const Color.fromARGB(255, 153, 189, 23),
                     gradient: LinearGradient(colors: [Colors.white70,Colors.black],transform: GradientRotation(20),),
                     
                      borderRadius: BorderRadius.circular(18),
                      
                   ),
                   child: Center(
                     child: Column(
                       children: [
                          SizedBox(height: 10,),
                           Icon(Icons.fiber_new_sharp,color: Colors.white,size: 30,),
                           SizedBox(height: 10,),
                           Text('SPEACIAL',style: TextStyle(
                             fontSize: 20,
                              fontWeight: FontWeight.bold,
                             fontStyle: FontStyle.normal,
                             color: Colors.white
                           ),)
                       ],
                     ),
                   ),
                 ),
               ),
                   InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> Wedding()));
             },
             child: Container(
               height: 100,
               width: 180,
               decoration: BoxDecoration(
                 // color: const Color.fromARGB(255, 177, 2, 160),
                 gradient: LinearGradient(colors: [Colors.white,Colors.black],transform: GradientRotation(30)),
                  borderRadius: BorderRadius.circular(18)
               ),
               child: Center(
                 child: Column(
                   children: [
                     SizedBox(height: 10,),
                     Icon(Icons.calendar_month_outlined,color: Colors.white,size: 30,),
                     SizedBox(height: 10,),
                     Text('WEDDING',style: TextStyle(
                       fontSize: 20,
                        fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.normal,
                       color: Colors.white
                     ),)
                   ],
                 ),
               ),
             ),
           )
             ],
           ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: 
EdgeInsets.all(10),
child: Text('Popular Vendors',style: TextStyle(
  color: Colors.white,
  fontSize: 22,
  // fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  
),),
),
            ],
          ),
 SizedBox(
          // height: MediaQuery.of(context).size.height * 0.5, // ✅ Set height
          child: ListView.builder(
            itemCount: vendors.length,
            shrinkWrap: true, 
            physics: NeverScrollableScrollPhysics(), // ✅ Prevents nested scrolling issues
            itemBuilder: (context, index) => vendorscard(vendors[index]),
          ),
        ),
    
        
   
            ],
          ),
        );
}
      
            
    PreferredSizeWidget buildappbar(){
return AppBar(
  elevation: 0,
backgroundColor: Colors.transparent,
title: Column(
  crossAxisAlignment:CrossAxisAlignment.start,
  children: [
    Text('EVENTO',style: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,

    ),),
    Text('plan your perfect event',style: TextStyle(
      color: Colors.white60,
      fontSize: 14
    ),)
  ],
),
actions: [
  IconButton(onPressed:() {
    gotowishlist();
  }, icon: Icon(Icons.favorite,color: Colors.white,)),
  IconButton( icon:Stack(
    children: [
      Icon(Icons.notifications_none_rounded,color: Colors.white,size: 25,),
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
          child: Text('2',style: TextStyle(
            color: Colors.white,
            fontSize: 8

          ),
          textAlign: TextAlign.center,
          ),
        )
      ),
    ],
  ),
  onPressed: (){

  },
  )
],
);


        }

    Widget buildsearchbar() {
  return Column(
    mainAxisSize: MainAxisSize.min, // Prevents unnecessary space
    children: [
      /// 🔹 **Search Input Field**
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: searchcontroller,
          onChanged: (value) {
            setState(() {
              search = value;
              searchListNew(); // Update search results
            });
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search events, venues, or vendors...',
            prefixIcon: Icon(Icons.search, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white60),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: search.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      searchcontroller.clear();
                      setState(() {
                        search = '';
                        searched.clear();
                      });
                    },
                  )
                : null,
          ),
        ),
      ),

     
      search.isNotEmpty
          ? SizedBox(
              height: 400, 
              child: searched.isEmpty
                  ? Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searched.length,
                      itemBuilder: (context, index) {
                        final data = searched[index];
                        return ListTile(
                          title: Text(
                            data.name ?? 'No Name',
                            style: TextStyle(color: Colors.white),
                          ),

                          
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Details(name: data.name, phone: data.phone, email: data.email, date: data.date, location: data.location, venue: data.venue, index: index, eimage: data.image)));
                          },
                        );
                      },
                    ),
            )
          : SizedBox.shrink(
            
          ),
           // **Hides search list when empty**
    ],
  );

}

 Widget vendorscard(vendormodel vendor){

return Card(
  margin: EdgeInsetsDirectional.symmetric(vertical: 8,horizontal: 19),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  child: Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        child: Image.asset(vendor.imagepath!,height: 250,fit: BoxFit.cover,width: double.infinity,),
      ),
      ListTile(
        contentPadding:  EdgeInsets.all(10),
            title: Text(
              
              vendor.name! ,
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
            vendor.description!,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () async {
              await togglefavorite(vendor);
               setState(() { // ✅ Refresh UI instantly
                vendor.isfavorited = !vendor.isfavorited;
              });

             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content:Text('added to favorites',style: TextStyle(
color: Colors.black,
      
    ),),
    backgroundColor: Colors.white,
    ),
    
    );
              
             
            }   ,          icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child:
                
                 Icon(
vendor.isfavorited ? 
                
                Icons.favorite :Icons.favorite_border_outlined ,
                  color:vendor.isfavorited ?  Colors.red : 
                    Colors.black,
                ),
              ),
            ),
          ),
    ],
  ),
);

}

 gotowishlist() async {
  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Whislist(), 
    ),
  );
}



  }







  



