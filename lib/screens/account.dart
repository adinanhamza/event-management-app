import 'package:event_managment/screens/constants.dart';
import 'package:flutter/material.dart';
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                backgroundImage: AssetImage(accountscreen.profileImage),
                radius: 45,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    accountscreen.accountName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                   accountscreen.accountRole,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCountColumn('Event',accountscreen.eventsCount),
                  _buildCountColumn('Attending', accountscreen.attendingCount),
                  _buildCountColumn('Following',accountscreen.followingCount),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 10, color: Colors.white24),
              const SizedBox(height: 20),
              _buildSectionTitle(accountscreen.personalInfoTitle),
              _buildInfoTile(
                icon: Icons.email,
                title: accountscreen.emailaccount,
                subtitle:accountscreen.userEmail,
              ),
              _buildInfoTile(
                icon: Icons.phone,
                title: accountscreen.phoneaccount,
                subtitle: accountscreen.userPhone,
              ),
              _buildInfoTile(
                icon: Icons.location_on,
                title: accountscreen.locationaccount,
                subtitle: accountscreen.userLocation,
              ),
              _buildInfoTile(
                icon: Icons.work,
                title: accountscreen.organizationLabel,
                subtitle: accountscreen.userOrganization,
              ),
              const Divider(thickness: 10, color: Colors.white24),
              const SizedBox(height: 20),
              _buildSectionTitle(accountscreen.settingsTitle),
              _buildSettingsTile(
                icon: Icons.notifications,
                title: accountscreen.notificationsLabel,
              ),
              _buildSettingsTile(
                icon: Icons.privacy_tip,
                title:accountscreen.privacyLabel,
              ),
              _buildSettingsTile(
                icon: Icons.payment,
                title: accountscreen.paymentLabel,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountColumn(String title, String count) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white54,
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
    );
  }
}