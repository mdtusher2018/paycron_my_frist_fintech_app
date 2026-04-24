import 'package:flutter/material.dart';
import 'package:paycron_app/src/presentation/features/home/home_view.dart';
import 'package:paycron_app/src/presentation/features/profile/page/profile_page.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    Center(child: Text("Analytics")),
    Center(child: Text("Scan")),
    Center(child: Text("Chat")),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }
}
