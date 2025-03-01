import 'package:event_managment/view/account/account.dart';
import 'package:event_managment/view/booking/booking.dart';
import 'package:event_managment/view/home/homescreen.dart';
import 'package:event_managment/view/listevent/listevent.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
  
  List<Widget>  pages = [
      Homescreen(),
      Bookingscreen(),
      Listevent(),
      Account(),
    ];

  return Scaffold(
    body:pages[selectedIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: selectedIndex, 
      onTap: (index) {
        setState(() {
          selectedIndex = index; 
        });
      },
      type: BottomNavigationBarType.fixed, 
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.white60,
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outlined),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_available_outlined),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    ),
  );


  }
}
