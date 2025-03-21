import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaste_events/pages/Order_page/order_page.dart';
import 'package:namaste_events/pages/Profile_page/profile_page.dart';
import 'package:namaste_events/pages/Vendor_page/vendor_page.dart';
import 'package:namaste_events/pages/create_page/create_page.dart';
import 'package:namaste_events/pages/home_page.dart';
import 'package:namaste_events/splashscreen.dart';

void main() {
  runApp(const NamasteEvents());
}

class NamasteEvents extends StatelessWidget {
  const NamasteEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(), // Custom Google Font
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/vendors': (context) => const VendorPage(),
        '/create': (context) => const CreatePage(),
        '/orders': (context) => const OrderPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
