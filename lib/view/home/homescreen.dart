import 'package:event_managment/controller/dbfunctions.dart';
import 'package:event_managment/controller/vmfunctions.dart';
import 'package:event_managment/model/model.dart';
import 'package:event_managment/model/vendormodel.dart';
import 'package:event_managment/view/constants/constants.dart';
import 'package:event_managment/view/details/details.dart';
import 'package:event_managment/view/home/home_widget.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String search = '';
  List<eventmodel> searched = [];
  double ratings = 4.4;
  int reviews = 132;

  final TextEditingController searchcontroller = TextEditingController();

  void searchListNew() {
    searched = eventlistnotifier.value
        .where((smodel) =>
            smodel.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallfavoritevendors();
  }
  @override
  Widget build(BuildContext context) {
    getallfavoritevendors();
    return SafeArea(
      child: Scaffold(
      
        backgroundColor: Colors.black,

  


        appBar: buildappbar(context),
    
  

   body:   SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          buildSearchBar(),
          const SizedBox(height: 20),
          buildImageCarousel(),
          const SizedBox(height: 20),
          buildCategoriesSection(context),
          const SizedBox(height: 20),
          buildPopularVendorsSection(),
          
        ],
      ),
    )));
    
  }


  void toggleFavorite(vendormodel vendor) async {
    await togglefavorite(vendor);
    setState(() => vendor.isfavorited = !vendor.isfavorited);
    showFavoriteSnackbar(context);
  }
  

Widget buildSearchBar() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      searchInputField(), 
      if (search.isNotEmpty) buildSearchResults(),
    ],
  );
}


Widget searchInputField( ) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(16),
    ),
    child: TextField(
      controller: searchcontroller,
      onChanged: (value) => setState(() {
        search = value;
        searchListNew();
      }),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: AppConstants.searchHint,
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white60),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        suffixIcon: search.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.white),
                onPressed: () => setState(() {
                  searchcontroller.clear();
                  search = '';
                  searched.clear();
                }),
              )
            : null,
      ),
    ),
  );
}


Widget buildSearchResults() {
  return SizedBox(
    height: 400,
    child: searched.isEmpty
        ? const Center(
            child: Text(AppConstants.noResults, style: TextStyle(color: Colors.white)),
          )
        : ListView.builder(
            itemCount: searched.length,
            itemBuilder: (context, index) {
              final data = searched[index];
              return ListTile(
                title: Text(data.name ?? 'No Name', style: const TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Details(
                      name: data.name,
                      phone: data.phone,
                      email: data.email,
                      date: data.date,
                      location: data.location,
                      venue: data.venue,
                      index: index,
                      eimage: data.image,
                    ),
                  ));
                },
              );
            },
          ),
  ); 
}
}

