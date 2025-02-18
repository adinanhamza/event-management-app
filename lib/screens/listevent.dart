import 'dart:io';

import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/model/model.dart';
import 'package:event_managment/screens/details.dart';
import 'package:event_managment/screens/editbooking.dart';
import 'package:flutter/material.dart';

class Listevent extends StatefulWidget {
 const Listevent({super.key});

  @override
  State<Listevent> createState() => _ListeventState();
}

class _ListeventState extends State<Listevent> {
  @override
  Widget build(BuildContext context) {
    getallevents();
    return SafeArea(child: 
    Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height:20,),
          Center(
            child: Text('Events',style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal
            ),),
          ),
        Expanded(child: 
        ValueListenableBuilder<List<eventmodel>>(
          valueListenable: eventlistnotifier,
           builder: (context,eventlist,child){
            if(eventlist.isEmpty){
              return Center(
                child: Text('No events found',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
              );

            }
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(color: Colors.grey,),
              itemCount: eventlist.length,
              itemBuilder: (context,index){
                  final data = eventlist[index];
                  return Padding(
                    padding: EdgeInsets.all(18),
                    child: Card(
                        elevation: 5,
                        child: ListTile(
                          // visualDensity: VisualDensity(horizontal: BorderSide.strokeAlignInside),
                          tileColor: Colors.white,  
                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          onTap: () {
                            
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Details(
                          eimage: data.image,
                            index: index,
                            name: data.name,
                            phone: data.phone,
                            date: data.date,
                            email: data.email,
                            location: data.location,
                            venue: data.venue,
                    
                          )));
                          },
                          leading:  CircleAvatar(
              backgroundImage: data.image != null && data.image!.isNotEmpty
                  ? FileImage(File(data.image!))
                  : AssetImage('asset/avatarcontact.jpg') as ImageProvider,
            ),
                          title: Text(data.name!,style:TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                          subtitle: Text(data.date!,style:TextStyle(
                            color: Colors.black
                          
                          ),),
                          trailing: IconButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Editbooking(index: index, name: data.name, email: data.email, phone:data.phone , date: data.date, venue: data.venue, location: data.location),),);

                          }, icon: Icon(Icons.edit,color: Colors.black,size: 22,)),
                        ),
                    ),
                  );
              }
              
          );


        },),),
        ],
      ),
    ));
  }
}