import 'package:event_managment/view/constants/constants.dart';
import 'package:flutter/material.dart';


class Wedding extends StatelessWidget {
  const Wedding({super.key});

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
            _buildTitle(weddingConstants.weddingHeader),
            const SizedBox(height: 10),
            _buildDescription(weddingConstants.weddingDescription),
            const SizedBox(height: 20),
            _buildImage(weddingConstants.weddingImages[0]),
            const SizedBox(height: 20),
            _buildTitle(weddingConstants.weddingServices),
            const SizedBox(height: 10),

            // 🟢 Wedding Services (Dynamically Loaded from Constants)
            Column(
              children: List.generate(weddingConstants.weddingServicesList.length, (index) {
                final service = weddingConstants.weddingServicesList[index];
                return Column(
                  children: [
                    _buildServiceItem(service["title"]!, service["description"]!),
                    const SizedBox(height: 5),
                    _buildImage(weddingConstants.weddingImages[index + 1]),
                    const SizedBox(height: 20),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // 🟢 **AppBar Widget**
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(weddingConstants.weddingTitle, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
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
      style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  // 🟢 **Description Widget**
  Widget _buildDescription(String description) {
    return Text(description, style: const TextStyle(color: Colors.white70, fontSize: 16));
  }

  // 🟢 **Wedding Services Widget**
  Widget _buildServiceItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.white, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🟢 **Image Widget**
  Widget _buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imagePath, width: double.infinity, height: 200, fit: BoxFit.cover),
    );
  }
}
