import 'package:flutter/material.dart';
import 'package:tradetasks/Compont/colors.dart';
import 'package:tradetasks/Compont/textfield.dart';
import 'package:tradetasks/screen/home.dart';
import 'package:tradetasks/screen/register.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  // Controllers for handling user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'lib/images/clock.png',
                fit: BoxFit.cover,
                width: 287.39,
                height: 180.56,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome Back',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Login to your account',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.lightCyan,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: 'Enter your email',
                obscureText: false,
                controller: _emailController,
                label: 'Email',
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Enter your password",
                obscureText: true,
                controller: _passwordController,
                label: 'Password',
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: AppColors.lightCyan,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const TradeTasks()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.lightCyan,
                    onPrimary: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New Here? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print('Register');
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegistScreen()));
                      // Navigate to the registration screen
                    },
                    child: const Text(
                      "Create an Account",
                      style: TextStyle(
                        color: AppColors.lightCyan,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
