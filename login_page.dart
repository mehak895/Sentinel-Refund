import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SentinelRefund',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0071DC),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your phone number to sign in',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixText: '+91 ',
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
// You can add validation here
                  Navigator.pushNamed(context, '/recent');
                },
                child: const Text('Continue'),
              ),
              const SizedBox(height: 32),
              const Icon(Icons.fingerprint, size: 60, color: Colors.grey),
              const SizedBox(height: 8),
              const Text('Use fingerprint', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}