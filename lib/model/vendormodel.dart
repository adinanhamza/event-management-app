


import 'package:hive_flutter/adapters.dart';
part 'vendormodel.g.dart';

@HiveType(typeId: 1)
class vendormodel extends HiveObject{


  @HiveField(0)
   String? id;

  @HiveField(1)
   String? name;

  @HiveField(2)
   String? description;

  @HiveField(3)
   String? imagepath;

  @HiveField(4)
  bool isfavorited;

  vendormodel({required this.id,required this.name,required this.description,required this.imagepath, this.isfavorited = false});
}

