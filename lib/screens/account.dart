import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title:  Text(
      //             'Profile',
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 25,
      //                 fontStyle: FontStyle.italic,
      //                 fontWeight: FontWeight.bold),
      //           ),
                
      //           leading:  Icon(Icons.arrow_back,color: Colors.white,size: 25,),
      //           actions: [
      //              Icon(Icons.edit,size: 25,color: Colors.white,)
      //           ],
      //           backgroundColor: Colors.black,
      //           centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('asset/profile.jpg'),
              radius: 45,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Jhony Walker',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  'Event Client ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Event',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '26',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Attending',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '14',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '137',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Divider(
              thickness: 10,
              color: Colors.white24,
        
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Persnol information',style: TextStyle(
                  color: Colors.white,
                  fontSize: 22
                  ,
                  fontWeight: FontWeight.w400
                ),),
              ],
            ),
             SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.email,size: 30,color: Colors.white,),
              title: Text('Email',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text('jhonywalker67@gmail.com',style: TextStyle(
                fontSize: 15,
                color: Colors.white54
              ),),
            ),
             ListTile(
              leading: Icon(Icons.phone,size: 30,color: Colors.white,),
              title: Text('Phone',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text('+91 9897434752',style: TextStyle(
                fontSize: 15,
                color: Colors.white54
              ),),
            ),
             ListTile(
              leading: Icon(Icons.location_on,size: 30,color: Colors.white,),
              title: Text('Location',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text('New York , USA',style: TextStyle(
                fontSize: 15,
                color: Colors.white54
              ),),
            ),
         ListTile(
            leading: Icon(Icons.work,size: 30,color: Colors.white,),
            title: Text('Organization',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            subtitle: Text('Event Client',style: TextStyle(
              fontSize: 15,
              color: Colors.white54
            ),),
          ),
           Divider(
              thickness: 10,
              color: Colors.white24,
        
            ),
           SizedBox(height: 20,),
           Row(
              children: [
                Text('Settings & Privacy',style: TextStyle(
                  color: Colors.white,
                  fontSize: 22
                  ,
                  fontWeight: FontWeight.w400
                ),),
              ],
            ),
             SizedBox(height: 10,),
              ListTile(
              leading: Icon(Icons.notifications,size: 30,color: Colors.white,),
              title: Text('Notification Prefrences',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
             trailing: Icon(Icons.arrow_forward_ios),
            ),
            
              ListTile(
              leading: Icon(Icons.privacy_tip,size: 30,color: Colors.white,),
              title: Text('Privacy Settings',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
             trailing: Icon(Icons.arrow_forward_ios),
            ),
                          ListTile(
              leading: Icon(Icons.payment,size: 30,color: Colors.white,),
              title: Text('Payment Methods',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
             trailing: Icon(Icons.arrow_forward_ios),
            ),
            
        
          ],
        ),
      ),
    ));
  }
}
