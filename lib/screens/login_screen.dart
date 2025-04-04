import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/user_model.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';

  // Email validation: Must end with @gmail.com
  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$").hasMatch(email);
  }

  // Password validation: 8+ chars, 1 uppercase, 1 lowercase, 1 number
  bool isValidPassword(String password) {
    return RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$").hasMatch(password);
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final user = await authRepository.loginUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        setState(() {
          errorMessage = 'Invalid email or password';
        });
      }
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final newUser = User(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      try {
        await authRepository.registerUser(newUser);
        setState(() {
          errorMessage = 'User registered successfully. Please log in.';
        });
      } catch (e) {
        setState(() {
          errorMessage = 'Error: Email already exists.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Add form key for validation
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!isValidEmail(value)) {
                    return 'Enter a valid Gmail address (example@gmail.com)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (!isValidPassword(value)) {
                    return 'Password must be 8+ chars, include UPPER, lower, and a number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(errorMessage, style: TextStyle(color: Colors.red)),
              ElevatedButton(onPressed: _login, child: Text('Login')),
              ElevatedButton(onPressed: _register, child: Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}
