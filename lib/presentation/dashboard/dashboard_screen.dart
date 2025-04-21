import 'package:flutter/material.dart';
import 'package:qalam_app/presentation/widgets/custom_bottom_navigation_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qalam App'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        backgroundColor: const Color(0xFF1B5E20),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const SafeArea(child: CustomBottomNavigationBar()),
    );
  }
}
