import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tradetasks/Compont/colors.dart';
import 'package:tradetasks/Compont/textfield.dart';
import 'package:tradetasks/screen/home.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({Key? key}) : super(key: key);

  @override
  _RegistScreenState createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _businessWebsiteController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _businessController = TextEditingController();

  bool _isLoading = false; // Flag for loading state

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _businessNameController.dispose();
    _phoneController.dispose();
    _businessAddressController.dispose();
    _businessWebsiteController.dispose();
    _passwordConfirmController.dispose();
    _businessController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  'Create Account',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Create Account Register to get started!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.lightCyan,
                    fontSize: 14,
                  )
                ),
                const SizedBox(height: 10),
               Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.teal,
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () {
                          // Handle profile picture selection
                        },
                      ),
                    ),
                  ),
                ],
              ),
                MyTextField(
                  hintText: 'Enter your Business Name',
                  obscureText: false,
                  controller: _businessNameController,
                  label: 'Business Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your business name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hintText: 'Enter your email',
                  obscureText: false,
                  controller: _emailController,
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hintText: "Enter your password",
                  obscureText: true,
                  controller: _passwordController,
                  label: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hintText: "Confirm your password",
                  obscureText: true,
                  controller: _passwordConfirmController,
                  label: 'Confirm Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: AppColors.lightCyan,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: IntlPhoneField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Business Contact Number',
                              labelStyle: TextStyle(
                                fontSize: 10,
                                color: AppColors.lightCyan,
                              ),
                              border: InputBorder.none,
                            ),
                            initialCountryCode: 'NG',
                            textAlign: TextAlign.start,
                            onChanged: (phone) {},
                            dropdownDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: AppColors.primaryColor,
                              border: Border.fromBorderSide(
                                BorderSide(
                                  color: AppColors.lightCyan,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.number.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hintText: "Enter your Business address",
                  obscureText: false,
                  controller: _businessAddressController,
                  label: 'Business Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your business address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hintText: "Enter Business Website",
                  obscureText: false,
                  controller: _businessWebsiteController,
                  label: 'Business Website',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your business website';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hintText: "Enter information about your business",
                  obscureText: false,
                  controller: _businessController,
                  label: 'About Business',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter information about your business';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                //register
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _isLoading
                            ? null // Disable button while loading
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true; // Show loading state
                                  });
                                  // ... your registration logic here ...
                                  // e.g., send data to your backend
                                  // ...
                                  // After successful registration:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TradeTasks()),
                                  );
                                  setState(() {
                                    _isLoading = false; // Hide loading state
                                  });
                                }
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
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              ) // Show progress indicator during loading
                            : const Text('Register'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Register');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TradeTasks()));
                      },
                      child: const Text(
                        "Login here",
                        style: TextStyle(
                          color: AppColors.lightCyan,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
