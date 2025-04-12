import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:secondapp/pages/orders_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: CircleAvatar(
                radius: 60,
                foregroundImage: AssetImage("images/profile.jpg"),
              ),
            ),
          ),
          Center(
            child: Text(
              "Iradukunda wilson",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Center(
            child: Text(
              "Iradukunda@gmail.com",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 25),
          ListTile(
            title: Text("My Orders"),
            leading: Icon(IconlyLight.bag),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrdersPage()),
              );
            },
          ),
          ListTile(
            title: Text("About Account & Privacy"),
            leading: Icon(IconlyLight.infoSquare),
            onTap: () {},
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(IconlyLight.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
