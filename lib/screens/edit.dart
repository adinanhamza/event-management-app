import 'dart:io';
import 'package:event_managment/functions/dbfunctions.dart';
import 'package:event_managment/model/model.dart';
import 'package:event_managment/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class EditBooking extends StatefulWidget {
  final int index;
  final String? name, email, phone, date, venue, location, imagePath;

  const EditBooking({
    super.key,
    required this.index,
    required this.name,
    required this.email,
    required this.phone,
    required this.date,
    required this.venue,
    required this.location,
    required this.imagePath,
  });

  @override
  State<EditBooking> createState() => _EditBookingState();
}

class _EditBookingState extends State<EditBooking> {
  late File? selectedImage;
  DateTime? selectedDate;

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController dateController;
  late TextEditingController locationController;
  late TextEditingController venueController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
    emailController = TextEditingController(text: widget.email);
    dateController = TextEditingController(text: widget.date);
    locationController = TextEditingController(text: widget.location);
    venueController = TextEditingController(text: widget.venue);

    selectedImage = widget.imagePath != null && widget.imagePath!.isNotEmpty
        ? File(widget.imagePath!)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
             editConstants.editBookingTitle, // ✅ Use Constants
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),

              // Info Box
              _buildInfoBox(),

              const SizedBox(height: 40),

              // Image Picker
              _buildImagePicker(),

              const SizedBox(height: 20),

              // Form Fields
              _buildTextField(nameController, editConstants.labelName, Icons.person_3_outlined),
              _buildTextField(phoneController, editConstants.labelPhone, Icons.phone_android_outlined, isPhone: true),
              _buildTextField(emailController, editConstants.labelEmail, Icons.email_outlined),
              _buildDateField(),
              _buildTextField(locationController, editConstants.labelLocation, Icons.share_location_outlined),
              _buildTextField(venueController,editConstants.labelVenue, Icons.celebration),

              const SizedBox(height: 20),

              // Submit Button
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  // 🟢 Info Box
  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.black, Colors.teal], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(editConstants.formHeaderTitle, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(editConstants.formSubText, style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🟢 Image Picker
  Widget _buildImagePicker() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: selectedImage != null ? FileImage(selectedImage!) : null,
          child: selectedImage == null
              ? Padding(padding: const EdgeInsets.all(9), child: Image.asset(editConstants.defaultProfileImage, height: 200, width: 200))
              : null,
        ),
        const SizedBox(height: 5),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.white, shape: const StadiumBorder()),
          onPressed: pickGalleryImage,
          child: const Text(editConstants.addImage, style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic)),
        ),
      ],
    );
  }

  // 🟢 Form Fields
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isPhone = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  // 🟢 Date Picker Field
  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: dateController,
        decoration: InputDecoration(
          labelText:editConstants.labelDate,
          prefixIcon: IconButton(icon: const Icon(Icons.date_range_outlined), onPressed: () => _selectDate(context)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  // 🟢 Submit Button
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: editBooking,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), elevation: 2),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(editConstants.submitButton, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    );
  }

  // 🟢 Select Date
  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
    if (picked != null) {
      setState(() => dateController.text = DateFormat('yyyy-MM-dd').format(picked));
    }
  }

  // 🟢 Pick Image
  Future<void> pickGalleryImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) setState(() => selectedImage = File(pickedImage.path));
  }

  // 🟢 Edit Booking
  void editBooking() {
    final editedData = eventmodel(name: nameController.text, phone: phoneController.text, email: emailController.text, date: dateController.text, venue: venueController.text, location: locationController.text, image: selectedImage?.path ?? '');
    editeevent(editedData, widget.index);
  }
}
