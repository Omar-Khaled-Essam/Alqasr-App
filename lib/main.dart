import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/theme.dart';
import 'utils/constants.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/reservations_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/cities_screen.dart';
import 'screens/city_rooms_screen.dart';
import 'screens/blog_screen.dart';

void main() {
  runApp(const AlQasrApp());
}

class AlQasrApp extends StatelessWidget {
  const AlQasrApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppConstants.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/cities': (context) => const CitiesScreen(),
        '/city-rooms': (context) => const CityRoomsScreen(),
        '/blog': (context) => const BlogScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/reservations': (context) => const ReservationsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/booking': (context) {
          // This route would normally receive hotel and room data as arguments
          // For now, we'll navigate to home instead
          return const HomeScreen();
        },
      },
    );
  }
}