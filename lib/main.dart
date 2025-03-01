
import 'package:event_managment/model/model.dart';
import 'package:event_managment/model/vendormodel.dart';

import 'package:event_managment/view/splashscreen/splashscreen.dart';

import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';





Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();

if(!Hive.isAdapterRegistered(eventmodelAdapter().typeId)){
  Hive.registerAdapter(eventmodelAdapter());
}

if(!Hive.isAdapterRegistered(vendormodelAdapter().typeId)){
  Hive.registerAdapter(vendormodelAdapter());
}

  await Hive.openBox<vendormodel>('vendordatabase');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}