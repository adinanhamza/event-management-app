
import 'package:event_managment/model/model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


ValueNotifier<List<eventmodel>> eventlistnotifier= ValueNotifier([]);

void addevent(eventmodel eventdata)async{
  final eventbox = await Hive.openBox<eventmodel>('eventdatabase');
  await eventbox.add(eventdata);
  getallevents();
}



 Future <void> getallevents()async{
final eventbox = await Hive.openBox<eventmodel>('eventdatabase');
 eventlistnotifier.value.clear();
 eventlistnotifier.value.addAll(eventbox.values);
 eventlistnotifier.notifyListeners();
}

Future <void> editeevent(eventmodel editdata,int index)async{
final eventbox = await Hive.openBox<eventmodel>('eventdatabase');
await eventbox.put(index, editdata);
eventlistnotifier.notifyListeners();
getallevents();

}

Future <void> deleteevent(int index)async{
  final eventbox = await Hive.openBox<eventmodel>('eventdatabase');
  await eventbox.deleteAt(index);
  getallevents();
}