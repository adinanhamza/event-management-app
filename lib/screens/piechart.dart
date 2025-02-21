import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/screens/coporate.dart';
import 'package:event_managment/screens/weddding.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  @override
  void initState() {
    super.initState();
    getallevents();
  }

  final List<Color> colorList = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.yellow,
  ];

  final String wedding = 'wedding';
  final String corporate = 'corporate';
  final String special = 'special';
  final String private = 'private';
  final String birthday = 'birthday';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Event Chart", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),

         
          ValueListenableBuilder(
            valueListenable: eventlistnotifier,
            builder: (context, value, child) {
              final int weddingCount = value.where((event) => event.venue == wedding).length;
              final int corporateCount = value.where((event) => event.venue == corporate).length;
              final int specialCount = value.where((event) => event.venue == special).length;
              final int privateCount = value.where((event) => event.venue == private).length;
              final int birthdayCount = value.where((event) => event.venue == birthday).length;

              final List<PieChartSectionData> sections = [
                PieChartSectionData(value: weddingCount.toDouble(), color: Colors.blue, title: "Wedding"),
                PieChartSectionData(value: corporateCount.toDouble(), color: Colors.orange, title: "Corporate"),
                PieChartSectionData(value: specialCount.toDouble(), color: Colors.green, title: "Special"),
                PieChartSectionData(value: privateCount.toDouble(), color: Colors.red, title: "Private"),
                PieChartSectionData(value: birthdayCount.toDouble(), color: Colors.yellow, title: "Birthday"),
              ];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 250,
                  child: PieChart(
                    PieChartData(
                      sections: sections,
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                    ),
                  ),
                ),
              );
            },
          ),
SizedBox(height: 30,),
          const Text(
            "Event Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

      SizedBox(height: 30,),

        
          ValueListenableBuilder(
            valueListenable: eventlistnotifier,
            builder: (context, value, child) {
              return Column(
                children: [
                  _rowForText(eventName: "Wedding", count: value.where((e) => e.venue == wedding).length, color: Colors.blue),
                  _rowForText(eventName: "Corporate", count: value.where((e) => e.venue == corporate).length, color: Colors.orange),
                  _rowForText(eventName: "Special", count: value.where((e) => e.venue == special).length, color: Colors.green),
                  _rowForText(eventName: "Private", count: value.where((e) => e.venue == private).length, color: Colors.red),
                  _rowForText(eventName: "Birthday", count: value.where((e) => e.venue == birthday).length, color: Colors.yellow),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

 
  Widget _rowForText({required String eventName, required int count, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$eventName:", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          Text("$count", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
