import 'package:app/features/address/address_screen.dart';
import 'package:app/features/contact/contact_screen.dart';
import 'package:app/features/home/home_screen.dart';
import 'package:app/features/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List<Widget> _pages = [HomeScreen(), AddressScreen(), ContactScreen()];

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      body: _pages[mainController.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainController.currentIndex,
          onTap: (value) => mainController.setIndex(value),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Address'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Contact'),
          ]),
    );
  }
}
