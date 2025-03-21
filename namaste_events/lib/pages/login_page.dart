import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaste_events/components/custom_textfield.dart';
import 'package:namaste_events/components/my_button.dart';
import 'package:namaste_events/pages/forget_password.dart';
import 'package:namaste_events/pages/home_page.dart';
import 'package:namaste_events/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  void signUserIn() {
    // Close keyboard on sign-in button press
    FocusScope.of(context).unfocus();

    // Validate email format
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      // Show error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Simple email validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    // Navigate to HomePage after successful validation
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Dismiss keyboard when tapping outside
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEAF2FF), Color(0xFFD6F5E3)], // Soft gradient
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome Text
                Text(
                  "Welcome back",
                  style: GoogleFonts.rubik(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                // Subtitle
                Text(
                  '"Turning Plans into Perfect Moments!"',
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                // Email textfield
                CustomTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  labelText: 'Email',
                ),
                const SizedBox(height: 15),

                // Password textfield with visibility toggle
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
                const SizedBox(height: 25),

                // Forget password link
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Sign-in button
                MyButton(
                  text: "Sign In",
                  onTap: signUserIn,
                ),
                const SizedBox(height: 50),

                // Not a member? Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Join us',
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
    );
  }
}
