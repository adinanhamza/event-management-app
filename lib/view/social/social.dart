import 'package:event_managment/view/constants/constants.dart';
import 'package:flutter/material.dart';


class Social extends StatelessWidget {
  const Social({super.key});

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
            _buildTitle(socialConstants.socialHeader),
            const SizedBox(height: 10),
            _buildDescription(socialConstants.socialDescription),
            const SizedBox(height: 20),
            _buildMainImage(socialConstants.socialImages[0]),
            const SizedBox(height: 20),
            _buildTitle(socialConstants.socialSubHeader),
            const SizedBox(height: 10),
            _buildDescription(socialConstants.socialDetails),
            const SizedBox(height: 20),
            _buildImageRow(socialConstants.socialImages[1], socialConstants.socialImages[2]),
            const SizedBox(height: 20),
            _buildMainImage(socialConstants.socialImages[3]),
            const SizedBox(height: 20),
            _buildTitle(socialConstants.socialPackages),
            const SizedBox(height: 10),
            _buildDescription(socialConstants.socialPackagesDescription),
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
      title: const Text(socialConstants.socialTitle, style: TextStyle(color: Colors.white)),
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
      style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  // 🟢 **Description Widget**
  Widget _buildDescription(String description) {
    return Text(description, style: const TextStyle(color: Colors.white70, fontSize: 16));
  }

  // 🟢 **Single Image Widget**
  Widget _buildMainImage(String imagePath) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 🟢 **Two Images Row Widget**
  Widget _buildImageRow(String leftImage, String rightImage) {
    return Row(
      children: [
        Expanded(child: _buildMainImage(leftImage)),
        const SizedBox(width: 10),
        Expanded(child: _buildMainImage(rightImage)),
      ],
    );
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
      child: const Text("Explore Packages"),
    );
  }
}
