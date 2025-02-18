import 'dart:developer';
import 'dart:io';

import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/screens/piechart.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  int index;
  
   String?  name;
  String? phone;
  String? email;
   String? date;
   String? venue;
   String? location;
  dynamic  eimage;
   Details({super.key,required this.name,required this.phone,required this.email,required this.date,required this.location,required this.venue,required this.index,required this.eimage});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    log(widget.name?? 'no data');
    log(widget.phone?? 'no data');
     log(widget.date?? 'no data');
 log(widget.venue?? 'no data');
  log(widget.email?? 'no data');
   log(widget.location?? 'no data');
   log(widget.eimage?? 'no data');

    return SafeArea(child: 
    Scaffold(
      backgroundColor:  Colors.black,
      appBar: AppBar(
   title:       Text('EVENT DETAILS',style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontStyle: FontStyle.normal
        ),),
        centerTitle: true,
        backgroundColor: Colors.black,
             leading:    IconButton(onPressed: (){
          
               
                Navigator.of(context).pop();
                }, icon:Icon(Icons.arrow_back,color: Colors.white,size: 22,),),
                actions: [
                    IconButton(onPressed: (){
          
                deleteevent(widget.index);
                Navigator.of(context).pop();
                }, icon:Icon(Icons.delete,color: Colors.white,size: 22,),),
                ],
      ),
      body:Center(
        child: Column(
            children: [
       

              SizedBox(
        height:100 ,
      ),
       CircleAvatar(
      radius: 80,
    backgroundImage: widget.eimage != null && widget.eimage!.isNotEmpty
                  ? FileImage(File(widget.eimage!))
                  : AssetImage('asset/avatarcontact.jpg') as ImageProvider,
            ),
            
     
        SizedBox(
        height:20 ,
      ),
      Text('Name : ${widget.name}',style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),),
              SizedBox(
        height:10 ,
      ),
      Text('Email : ${widget.email}',style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),),
            SizedBox(
        height:10 ,
      ),
      Text('Phone: ${widget.phone}',style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),),
          SizedBox(
        height:10 ,
      ),
      Text('Date : ${widget.date}',style: TextStyle(
        color: Colors.white,
        fontSize:20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),),
          SizedBox(
        height:10 ,
      ),
      Text('venue : ${widget.venue}',style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),),
            SizedBox(
        height:10 ,
      ),
      Text('Location : ${widget.location}',style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),),
        
        
        ElevatedButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Dashbord()));

        }, child: Text('go chart'),
        style: ButtonStyle(
       


        ),
        )
            ]
            ),
      ),),);
  }
}