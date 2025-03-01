import 'dart:io';

import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/model/model.dart';
import 'package:event_managment/screens/constants.dart';
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
  String? ddselectedvalue;
  
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  final TextEditingController venuecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    ddselectedvalue = BookingConstants.eventTypes.first;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                _buildHeaderSection(),
                const SizedBox(height: 40),
                _buildAvatarSection(),
                const SizedBox(height: 20),
                _buildFormFields(),
                const SizedBox(height: 20),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
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
                  BookingConstants.bookingTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  BookingConstants.bookingSubtitle,
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
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: selectedImage != null 
              ? FileImage(selectedImage!) 
              : null,
          child: selectedImage == null
              ? Padding(
                  padding: const EdgeInsets.all(9),
                  child: Image.asset(
                    BookingConstants.avatarPlaceholder,
                    height: 200,
                    width: 200,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 5),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color.fromARGB(167, 0, 0, 0),
          ),
          onPressed: pickGalleryImage,
          child: const Text(BookingConstants.addImageText),
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildTextField(
          controller: namecontroller,
          label: BookingConstants.nameLabel,
          icon: Icons.person_3_outlined,
        ),
        const SizedBox(height: 15),
        _buildTextField(
          controller: phonecontroller,
          label: BookingConstants.phoneLabel,
          icon: Icons.phone_android_outlined,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        _buildTextField(
          controller: emailcontroller,
          label: BookingConstants.emailLabel,
          icon: Icons.email_outlined,
        ),
        const SizedBox(height: 10),
        _buildDateField(),
        const SizedBox(height: 10),
        _buildTextField(
          controller: locationcontroller,
          label: BookingConstants.locationLabel,
          icon: Icons.share_location_outlined,
        ),
        const SizedBox(height: 10),
        _buildEventTypeDropdown(),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Card(
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(label),
          prefixIcon: Icon(icon, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Card(
      child: TextField(
        controller: datecontroller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: const Text(BookingConstants.dateLabel),
          prefixIcon: IconButton(
            onPressed: () => selectDate(context),
            icon: const Icon(Icons.date_range_outlined),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildEventTypeDropdown() {
    return Card(
      child: TextField(
        controller: venuecontroller,
        readOnly: true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: const Text(BookingConstants.eventTypeLabel),
          prefixIcon: const Icon(Icons.celebration, color: Colors.black),
          suffixIcon: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: ddselectedvalue,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              items: BookingConstants.eventTypes.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  ddselectedvalue = newValue ?? BookingConstants.eventTypes.first;
                  venuecontroller.text = newValue!;
                });
              },
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: bookevent,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          BookingConstants.submitButtonText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        ),
      ),
    );
  }

  // Rest of the methods (pickGalleryImage, _selectDate, bookevent) remain same
  // with BookingConstants usage as shown in previous examples

  
  Future bookevent() async {
    String name = namecontroller.text;
    String email = emailcontroller.text;
    String phone = phonecontroller.text.toString();
    String date = datecontroller.text.toString();
    String venue = venuecontroller.text;
    String location = locationcontroller.text;

    if (name.isEmpty &&
            email.isEmpty &&
            date.isEmpty &&
            venue.isEmpty &&
            phone.isEmpty ||
        location.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text( BookingConstants.invalidFormMessage),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(20),
      ));
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          Text( BookingConstants.submissionSuccessMessage),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      margin: EdgeInsets.all(20),
    ));
    final evendata = eventmodel(
        name: name,
        phone: phone,
        email: email,
        date: date,
        venue: venue,
        location: location,
        image: selectedImage?.path ?? '');

    addevent(evendata);
    // Navigator.of(context)
        // .push(MaterialPageRoute(builder: (context) => Homescreen()));
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


Future<void> selectDate(BuildContext context) async {
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
}
