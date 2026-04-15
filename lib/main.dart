import 'package:flutter/material.dart';
import 'package:therapist_momnjo/ui/screens/booking_detail_screen.dart';

// Import semua screen yang sudah dibuat
import 'package:therapist_momnjo/ui/screens/splash_screen.dart';
import 'package:therapist_momnjo/ui/screens/auth/login_screen.dart';
import 'package:therapist_momnjo/ui/screens/auth/register_screen.dart';
import 'package:therapist_momnjo/ui/screens/home_screen.dart';
import 'package:therapist_momnjo/ui/screens/schedule_screen.dart';
import 'package:therapist_momnjo/ui/screens/visit_report_screen.dart';
import 'package:therapist_momnjo/ui/screens/arrival_checkin_screen.dart';
import 'package:therapist_momnjo/ui/screens/chat_admin_screen.dart';

void main() {
  // Memastikan binding Flutter sudah terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MomnjoTherapistApp());
}

class MomnjoTherapistApp extends StatelessWidget {
  const MomnjoTherapistApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momnjo Terapis',
      debugShowCheckedModeBanner: false, 
      
      // Pengaturan Tema Global Aplikasi
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFF48FB1), 
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF48FB1),
          primary: const Color(0xFFF48FB1),
          secondary: const Color(0xFFFFEBEE),
          surface: Colors.white,
        ),
        fontFamily: 'Poppins', 
        
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0, 
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87, 
            fontSize: 18, 
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        
        scaffoldBackgroundColor: const Color(0xFFFAFAFA), 

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF48FB1),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),

      // Halaman pertama yang akan muncul saat app dibuka
      initialRoute: '/', 
      
      // Daftar rute aplikasi
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/schedule': (context) => const ScheduleScreen(),
        '/visit_report': (context) => const VisitReportScreen(),
        '/arrival_checkin': (context) => const ArrivalCheckinScreen(),
        '/chat_admin': (context) => const ChatAdminScreen(),
        '/booking_detail': (context) => const BookingDetailScreen(),
      },

      // Fallback jika rute yang dituju tidak ditemukan
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      },
    );
  }
}