import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaste_events/components/custom_textfield.dart';
import 'package:namaste_events/components/my_button.dart';
import 'package:namaste_events/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Text editing controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  // Obscure password
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Checkbox state
  bool _agreeToTerms = false;

  // Sign up function
  void signUserUp() {
    FocusScope.of(context).unfocus(); // Close keyboard

    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmpasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Please agree to the Terms of Service and Privacy Policy')),
      );
      return;
    }

    // Navigate to HomePage after successful validation (replace LoginPage with your HomePage)
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              const LoginPage()), // Change to HomePage if needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Dismiss keyboard when tapping outside
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEAF2FF),
              Color(0xFFD6F5E3),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Join us to start searching",
                        style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '"Turning Plans into Perfect Moments!"',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomTextfield(
                        controller: nameController,
                        hintText: 'Name',
                        obscureText: false,
                        labelText: 'Name',
                      ),
                      const SizedBox(height: 15),
                      CustomTextfield(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 15),
                      CustomTextfield(
                        controller: passwordController,
                        hintText: 'Password',
                        labelText: 'Password',
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextfield(
                        controller: confirmpasswordController,
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        obscureText: _obscureConfirmPassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _agreeToTerms,
                              onChanged: (value) {
                                setState(() {
                                  _agreeToTerms = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                'I agree with the Terms of Service and Privacy Policy',
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      MyButton(
                        text: "Sign Up",
                        onTap: signUserUp,
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
