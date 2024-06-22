import 'package:flutter/material.dart';
import 'package:tradetasks/Compont/colors.dart';
import 'package:tradetasks/screen/login_screen.dart';

class WelScreen extends StatefulWidget {
  const WelScreen({super.key});

  @override
  State<WelScreen> createState() => _WelScreenState();
}

class _WelScreenState extends State<WelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'lib/images/wl1.png',
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image not found');
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:
                (context) => Login()));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor, // Set the button color
                  onPrimary: Colors.white, // Set the text color
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Start'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

