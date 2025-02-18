import 'dart:io';

import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/model/model.dart';
import 'package:event_managment/screens/homescreen.dart';
import 'package:event_managment/screens/listevent.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class Bookingscreen extends StatefulWidget {
  const Bookingscreen({super.key});

  @override
  State<Bookingscreen> createState() => _bookingscreenState();
}

class _bookingscreenState extends State<Bookingscreen> {
  
File? selectedImage; 
  DateTime? selecteddate;
  List ddoptions = ['wedding','birthday','coperate','private','speacial'];
  String? ddselectedvalue ;

TextEditingController namecontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController locationcontroller = TextEditingController();
TextEditingController venuecontroller = TextEditingController();
  @override
  void initState(){
    super.initState();
    ddselectedvalue = ddoptions.first;
  }
  Widget build(BuildContext context) {
  
    return SafeArea(child: 
    Scaffold(backgroundColor: Colors.black,
      
body:   SingleChildScrollView(
  child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
         
         children: [
                
          
                  Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.teal],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TELL US ABOUT YOUR EVENT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Fill in this handy form below and we will get back to you promptly',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                     
                    ],
                  ),
                                ),
                        
          
            SizedBox(height: 40,),
            CircleAvatar(
                          radius: 50,
                          backgroundColor:Colors.white,
                          backgroundImage: selectedImage != null
                              ? FileImage(selectedImage!) 
                              : null, 
                          child: selectedImage == null
                              ? Padding(
                                  padding: EdgeInsets.all(9),
                                  child:  Image.asset('asset/avatarcontact.jpg',height: 200,width: 200,),
                                )
                              : null, 
                        ),
                      
                      SizedBox(height: 5),
                      
                        TextButton(
                        style: TextButton.styleFrom(
                           backgroundColor: Colors.white,
                          foregroundColor: const Color.fromARGB(167, 0, 0, 0)

                        ),
                          onPressed: (){
                      
                      pickGalleryImage();
                     }, child: 
                     Text('Add Image'),
                     ),
                     SizedBox(height: 20,),
           Card(
             child: TextField(
               showCursor : false,
                 controller:namecontroller,
                 decoration: InputDecoration(
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                   label: Text('Name'),
                   // labelText:'Enter Your Full Name' ,
                   
                focusedBorder: OutlineInputBorder(),
                         
                   prefixIcon: const Icon(Icons.person_3_outlined,color: Colors.black),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),            
                   ),
                   filled: true,
                   fillColor: Colors.white
                 ),
               ),
           ),
             SizedBox(height: 15,),
          Card(
            child: TextField(
               showCursor : false,
                 controller:phonecontroller,
                 keyboardType: TextInputType.phone,
                 decoration: InputDecoration(
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                   label: Text('Enter Your Phone Number'),
                   // labelText:'Enter Your Full Name' ,
                   
                focusedBorder: OutlineInputBorder(),
                        
                   prefixIcon: const Icon(Icons.phone_android_outlined,color: Colors.black),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),            
                   ),
                   filled: true,
                   fillColor: Colors.white
                 ),
               ),
          ),
             SizedBox(height: 10,),
           Card(
             child: TextField(
               showCursor : false,
                 controller:emailcontroller,
                 decoration: InputDecoration(
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                   label: Text('Enter Your Em@il here'),
                   // labelText:'Enter Your Full Name' ,
                   
                focusedBorder: OutlineInputBorder(),
                         
                   prefixIcon: const Icon(Icons.email_outlined,color: Colors.black),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),            
                   ),
                   filled: true,
                   fillColor: Colors.white
                 ),
               ),
           ),
             SizedBox(height: 10,),
          Card(
            child: TextField(
               showCursor : false,
                 controller:datecontroller,
                 decoration: InputDecoration(
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                   label: Text('Enter Date here'),
                   // labelText:'Enter Your Full Name' ,
                   
                focusedBorder: OutlineInputBorder(),
                        
                   prefixIcon: 
                  IconButton(onPressed: (){
                    _selectDate(context);
                  }, icon: Icon(Icons.date_range_outlined)),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),            
                   ),
                   filled: true,
                   fillColor: Colors.white
                 ),
               ),
          ),
             SizedBox(height: 10,),
          Card(
            child: TextField(
               showCursor : false,
                 controller:locationcontroller,
                 decoration: InputDecoration(
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                   label: Text('Enter location here'),
                   // labelText:'Enter Your Full Name' ,
                   
                focusedBorder: OutlineInputBorder(),
                        
                   prefixIcon: const Icon(Icons.share_location_outlined,color: Colors.black),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),            
                   ),
                   filled: true,
                   fillColor: Colors.white
                 ),
               ),
          ),
             SizedBox(height: 10,),
          Card(
            child: TextField(
               showCursor : false,
                 controller:venuecontroller,
                 readOnly: true,
                 decoration: InputDecoration(
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                   label: Text('select Event '),
                   // labelText:'Enter Your Full Name' ,
                   
                   
                focusedBorder: OutlineInputBorder(),
                        
                   prefixIcon: const Icon(Icons.celebration,color: Colors.black),
                   suffixIcon: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: ddselectedvalue,
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),

                items: ddoptions.map(( item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    ddselectedvalue = newValue ?? 'no value';
                  venuecontroller.text = newValue!;
                  });
                },
              ),
            ),
                    
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),            
                   ),
                   filled: true,
                   fillColor: Colors.white 
                 ),
               ),
          ),
  SizedBox(height: 20,),
             ElevatedButton(onPressed: (){
              bookevent();
             }, child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
             child: Text('Submit', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),),
             
             ),
               style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
             
             )
         ],
                ),
              ),
)

    
   
   
    ));
  }



 // Gallery picker
  Future<void> pickGalleryImage() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;

    setState(() {
      selectedImage = File(returnImage.path); 
    });
   
  }


Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    
    if (picked != null && picked != selecteddate) {
      setState(() {
        selecteddate = picked;
        datecontroller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
 Future bookevent()async{
  
String name = namecontroller.text;
 String email = emailcontroller.text;
String phone = phonecontroller.text.toString();
String date = datecontroller.text.toString();
String venue = venuecontroller.text;
String location = locationcontroller.text;



if(name.isEmpty&&email.isEmpty&&date.isEmpty&&venue.isEmpty&& phone.isEmpty||location.isEmpty){
 return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('invalid format or fill the form'),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    margin:EdgeInsets.all(20),
    ));
}

ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(children:[
    Icon(Icons.arrow_forward,color: Colors.white,),
     Text('submited'),
     ],
     ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    margin:EdgeInsets.all(20),
    ));
final evendata = eventmodel(name: name, phone: phone, email: email, date: date, venue: venue, location: location,image: selectedImage?.path??'');

addevent(evendata);
Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Homescreen()));


  }
}


