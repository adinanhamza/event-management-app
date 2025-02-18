

import 'dart:math';

import 'package:event_managment/functions/vmfunctions.dart';
import 'package:event_managment/model/vendormodel.dart';
import 'package:flutter/material.dart';

class Whislist extends StatefulWidget {


   Whislist({super.key});

  @override
  _WhislistState createState() => _WhislistState();
}

class _WhislistState extends State<Whislist> {
  @override
  Widget build(BuildContext context) {
    
   setState(() {
     getallfavoritevendors();
    //  deletefavorite(, index)
   });
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist",style:TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.black,
      leading: IconButton(onPressed: (){
Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      backgroundColor: Colors.black12,
      body: 
                ValueListenableBuilder<List<vendormodel>>
         (valueListenable:vendorlistnotifier,
          builder:(context ,vendorlist,child){
            if(vendorlist.isEmpty){
return     Center(child: Text("No favorites yet", style: TextStyle(color: Colors.white)));

            }
            return  ListView.builder(
              itemCount: vendorlist.length,
              itemBuilder: (context, index) {
              final data =  vendorlist[index];
print('isfavorited is ${data.isfavorited}'); 
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 19),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(data.imagepath!, height: 250, fit: BoxFit.cover, width: double.infinity),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text(data.name!, style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold)),
                        subtitle: Text(data.description!, style: TextStyle(color: Colors.black)),
                        trailing: IconButton(
                          icon: 
                          
                          Icon(data.isfavorited ? 
                      
                
                Icons.favorite :Icons.favorite_border_outlined ,
                  color:data.isfavorited ?  Colors.red : 
                    Colors.black,),
                          onPressed: () async {
                          deletefavorite(data, index);
                          // Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
    
          }
          
          )
          

    );
  }
  
}