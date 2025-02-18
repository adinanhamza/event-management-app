import 'dart:io';
import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/screens/piechart.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final int index;
  final String? name, phone, email, date, venue, location;
  final String? eimage;

  const Details({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.date,
    required this.location,
    required this.venue,
    required this.index,
    required this.eimage,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'EVENT DETAILS',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {
              deleteevent(widget.index);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete, color: Colors.white, size: 22),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white10,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: widget.eimage != null && widget.eimage!.isNotEmpty
                      ? FileImage(File(widget.eimage!))
                      : const AssetImage('asset/avatarcontact.jpg') as ImageProvider,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black54, blurRadius: 10, spreadRadius: 2),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildDetailRow(Icons.person, "Name", widget.name!),
                    buildDetailRow(Icons.email, "Email", widget.email!),
                    buildDetailRow(Icons.phone, "Phone", widget.phone!),
                    buildDetailRow(Icons.date_range, "Date", widget.date!),
                    buildDetailRow(Icons.place, "Location", widget.location!),
                    buildDetailRow(Icons.event, "Venue", widget.venue!),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // 🟢 Button for Chart Navigation
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashbord())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.white30,
                  elevation: 6,
                ),
                child: const Text("View Chart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(IconData icon,String lable,String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "$lable: ${value ?? 'No Data'}",
              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
