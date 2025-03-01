import 'package:event_managment/view/constants/constants.dart';
import 'package:flutter/material.dart';


class Private extends StatelessWidget {
  const Private({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(specialConstants.privateSubtitle),
            const SizedBox(height: 10),
            _buildDescription(specialConstants.privateDescription),
            const SizedBox(height: 20),
            ..._buildImageGallery(specialConstants.privateImages),
            const SizedBox(height: 20),
            _buildTitle(specialConstants.privateServicesTitle),
            const SizedBox(height: 10),
            ..._buildServiceList(specialConstants.privateServices),
            const SizedBox(height: 20),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  // 🟢 **AppBar Widget**
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(specialConstants.privateTitle, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.my_library_add_outlined, color: Colors.white),
        ),
      ],
    );
  }

  // 🟢 **Title Widget**
  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  // 🟢 **Description Widget**
  Widget _buildDescription(String description) {
    return Text(description, style: const TextStyle(color: Colors.white70, fontSize: 16));
  }

  // 🟢 **Image Gallery Widget**
  List<Widget> _buildImageGallery(List<String> images) {
    return images
        .map((imagePath) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ))
        .toList();
  }

  // 🟢 **Service List Widget**
  List<Widget> _buildServiceList(List<Map<String, String>> services) {
    return services
        .map((service) => ListTile(
              leading: Icon(
                _getIcon(service['icon']!), // Converts string to icon
                color: Colors.white,
              ),
              title: Text(service['title']!, style: const TextStyle(color: Colors.white)),
              subtitle: Text(service['subtitle']!, style: const TextStyle(color: Colors.white70)),
            ))
        .toList();
  }

  // 🟢 **Action Button Widget**
  Widget _buildActionButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: const Text("Plan Your Special Event"),
    );
  }

  // 🟢 **Convert String to IconData**
  IconData _getIcon(String iconName) {
    switch (iconName) {
      case "star":
        return Icons.star;
      case "music_note":
        return Icons.music_note;
      case "celebration":
        return Icons.celebration;
      default:
        return Icons.event;
    }
  }
}
