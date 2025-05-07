import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart' as badges;
import 'package:secondapp/pages/cart_page.dart';
import 'package:secondapp/pages/explore_page.dart';
import 'package:secondapp/pages/profile_page.dart';
import 'package:secondapp/pages/services_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ExplorePage(),
    const ServicesPage(),
    const CartPage(),
    const ProfilePage(),
  ];
  int currentPage = 0;

  void _changePage(int index) {
    setState(() {
      currentPage = index;
    });
    Navigator.pop(context); // close the drawer after selecting
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top part of Drawer
            Column(
              children: [
                const DrawerHeader(
                  child: CircleAvatar(
                    radius: 70,
                    foregroundImage: AssetImage("images/profile.jpg"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(color: Colors.grey),
                ),
                ListTile(
                  leading: const Icon(IconlyBroken.home),
                  title: const Text("Home"),
                  onTap: () => _changePage(0),
                ),
                ListTile(
                  leading: const Icon(IconlyBroken.call),
                  title: const Text("Services"),
                  onTap: () => _changePage(1),
                ),
                ListTile(
                  leading: const Icon(IconlyBroken.buy),
                  title: const Text("Cart"),
                  onTap: () => _changePage(2),
                ),
                ListTile(
                  leading: const Icon(IconlyLight.profile),
                  title: const Text("Profile"),
                  onTap: () => _changePage(3),
                ),
              ],
            ),
            // Bottom part of Drawer (Logout)
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(IconlyLight.logout),
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bite Tresor", style: Theme.of(context).textTheme.titleMedium),
            Text(
              'Ryoherwa na service zacu',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                badgeStyle: const badges.BadgeStyle(badgeColor: Colors.green),
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                child: const Icon(IconlyBroken.notification),
              ),
            ),
          ),
        ],
      ),

      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(IconlyBroken.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.call),
            activeIcon: Icon(IconlyBroken.call),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            activeIcon: Icon(IconlyBroken.buy),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            activeIcon: Icon(IconlyBroken.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
