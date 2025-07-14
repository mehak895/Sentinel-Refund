import 'package:flutter/material.dart';
import 'package:sentinelrefund/login_page.dart';
import 'package:sentinelrefund/recent_orders_screen.dart';
import 'package:sentinelrefund/request_refund_screen.dart';
import 'package:sentinelrefund/refund_blocked_screen.dart';
import 'package:sentinelrefund/refund_requests_screen.dart';
import 'package:sentinelrefund/flagged_requests_screen.dart';
import 'package:sentinelrefund/refund_rejection_reason_screen.dart';

void main() {
  runApp(const SentinelRefundApp());
}

class SentinelRefundApp extends StatelessWidget {
  const SentinelRefundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SentinelRefund',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0071DC)),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xFF0071DC)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xFF0071DC), width: 2),
          ),
          labelStyle: TextStyle(color: Colors.grey),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0071DC),
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/recent': (context) => const RecentOrdersScreen(),
        '/refund': (context) => const RequestRefundScreen(),
        '/blocked': (context) => const RefundBlockedScreen(),
        '/refund_requests': (context) => const RefundRequestsScreen(),
      },
    );
  }
}
