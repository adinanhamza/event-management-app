import 'dart:io';
import 'package:event_managment/controller/dbfunctions.dart';
import 'package:event_managment/model/model.dart';
import 'package:event_managment/view/constants/constants.dart';
import 'package:event_managment/view/details/details.dart';
import 'package:event_managment/view/edit/edit.dart';
import 'package:flutter/material.dart';


class Listevent extends StatefulWidget {
  const Listevent({super.key});

  @override
  State<Listevent> createState() => _ListeventState();
}

class _ListeventState extends State<Listevent> {
  @override
  Widget build(BuildContext context) {
    getallevents();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                listeventConstants.eventTitle, // ✅ Use Constants
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<List<eventmodel>>(
                valueListenable: eventlistnotifier,
                builder: (context, eventlist, child) {
                  if (eventlist.isEmpty) {
                    return const Center(
                      child: Text(
                        listeventConstants.noEventsFound, // ✅ Use Constants
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
                  }

                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(color: Colors.grey),
                    itemCount: eventlist.length,
                    itemBuilder: (context, index) {
                      final data = eventlist[index];
                      return _buildEventCard(context, data, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🟢 Event Card Widget
  Widget _buildEventCard(BuildContext context, eventmodel data, int index) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Card(
        elevation: 5,
        child: ListTile(
          tileColor: Colors.white,
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18)),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Details(
                  eimage: data.image,
                  index: index,
                  name: data.name,
                  phone: data.phone,
                  date: data.date,
                  email: data.email,
                  location: data.location,
                  venue: data.venue,
                ),
              ),
            );
          },
          leading: _buildAvatar(data.image),
          title: Text(
            data.name!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            data.date!,
            style: const TextStyle(color: Colors.black),
          ),
          trailing: _buildEditButton(context, data, index),
        ),
      ),
    );
  }

  // 🟢 Avatar Widget
  Widget _buildAvatar(String? imagePath) {
    return CircleAvatar(
      backgroundImage: imagePath != null && imagePath.isNotEmpty
          ? FileImage(File(imagePath))
          : const AssetImage(listeventConstants.defaultProfileImage) as ImageProvider,
    );
  }

  // 🟢 Edit Button Widget
  Widget _buildEditButton(BuildContext context, eventmodel data, int index) {
    return IconButton(
      tooltip: listeventConstants.editButtonTooltip, // ✅ Use Constants
      icon: const Icon(Icons.edit, color: Colors.black, size: 22),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditBooking(
              index: index,
              name: data.name,
              email: data.email,
              phone: data.phone,
              date: data.date,
              venue: data.venue,
              location: data.location,
              imagePath: data.image,
            ),
          ),
        );
      },
    );
  }
}
