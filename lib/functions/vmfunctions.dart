
import 'package:event_managment/model/vendormodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

  ValueNotifier<List<vendormodel>> vendorlistnotifier = ValueNotifier([]); 
Future<void> togglefavorite(vendormodel vendor) async {
  final vbox = await  Hive.openBox<vendormodel>('vendordatabase');
  await vbox.add(vendor);

  if (vendor.isfavorited == true) {
    
    await vendor.save(); // ✅ Save changes directly in Hive

  }
  getallfavoritevendors();
}
 Future <void> getallfavoritevendors()async {
  final vbox = await Hive.openBox<vendormodel>('vendordatabase');
  vendorlistnotifier.value.clear();
  vendorlistnotifier.value.addAll(vbox.values);
  vendorlistnotifier.notifyListeners();
  

}

Future<void> deletefavorite(vendormodel vendor,int index) async {
  final vbox = await  Hive.openBox<vendormodel>('vendordatabase');
  

  if (vendor.isfavorited == false) {
    await vbox.deleteAt(index);
   // ✅ Save changes directly in Hive

  }
  getallfavoritevendors();
}



