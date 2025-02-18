import 'dart:io';

import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/model/model.dart';
import 'package:event_managment/screens/homescreen.dart';
import 'package:event_managment/screens/listevent.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class Editbooking extends StatefulWidget {
  final int index;
 final String? name;
 final String? email;
 final String? phone;
final  String? date;
  final String? venue;
 final  String? location;
   Editbooking({super.key,required this.index,required this.name,required this.email,required this.phone,required this.date,required this.venue,required this.location});

  @override
 
  State<Editbooking> createState() => _editbookingState();
}

class _editbookingState extends State<Editbooking> {
  
File? selectedImage; 
  DateTime? selecteddate;

late  TextEditingController namecontroller = TextEditingController();
late   TextEditingController phonecontroller = TextEditingController();
late  TextEditingController emailcontroller = TextEditingController();
late  TextEditingController datecontroller = TextEditingController();
late    TextEditingController locationcontroller = TextEditingController();
late    TextEditingController venuecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Initialize controllers with data from AddScreen
    namecontroller = TextEditingController(text: widget.name);
    phonecontroller = TextEditingController(text: widget.phone);
    emailcontroller = TextEditingController(text: widget.email);
    datecontroller = TextEditingController(text: widget.date);
    locationcontroller = TextEditingController(text: widget.location);
    venuecontroller = TextEditingController(text: widget.venue);
    

  }
  Widget build(BuildContext context) {
  
    return SafeArea(child: 
    Scaffold(backgroundColor: Colors.black,
      
body:   SingleChildScrollView(
  child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
         
         children: [
        
                Text('EDIT BOOKING',style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic
                ),),
          
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
                              'TELL US SOMETHING NEW',
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
                          backgroundColor: Colors.white,
                          backgroundImage: selectedImage != null
                              ? FileImage(selectedImage!) 
                              : null, 
                          child: selectedImage == null
                              ? Padding(
                                  padding: EdgeInsets.all(9),
                                  child: Image.asset('asset/avatarcontact.jpg',height: 200,width: 200,)
                                )
                              : null, 
                        ),
                      
                      SizedBox(height: 5),
                      
                        TextButton(
                        style: TextButton.styleFrom(
                           backgroundColor: Colors.white,
                          // foregroundColor: const Color.fromARGB(167, 0, 0, 0)
shape: StadiumBorder(),

                        ),
                          onPressed: (){
                      
                      pickGalleryImage();
                     }, child: 
                     Text('Add Image',style: 
                     TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic
                     ),),
                     ),
                     SizedBox(height: 10,),
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
                 decoration: InputDecoration(
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                   label: Text('what kind of Event '),
                   // labelText:'Enter Your Full Name' ,
                   
                focusedBorder: OutlineInputBorder(),
                        
                   prefixIcon: const Icon(Icons.celebration,color: Colors.black),
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
              editbook();
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
 Future editbook()async{
  
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
final editdata = eventmodel(name: name, phone: phone, email: email, date: date, venue: venue, location: location,image: selectedImage?.path??'');

editeevent(editdata,widget.index);
Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Homescreen()));


  }
}
