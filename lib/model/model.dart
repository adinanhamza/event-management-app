

import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class eventmodel{

@HiveField(0)
String? name;

@HiveField(1)
String? phone;

@HiveField(2)
String? email;

@HiveField(3)
String? date;

@HiveField(4)
String? location;

@HiveField(5)
String? venue;

@HiveField(6)
String? image;



eventmodel({required this.name,required this.phone,required this.email,required this.date,required this.venue,required this.location,required this.image});
}
