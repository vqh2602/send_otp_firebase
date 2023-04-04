import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:send_otp_firebase/firebase_options.dart';
import 'package:send_otp_firebase/screens/splash_screen.dart';
import 'package:send_otp_firebase/utils/app_theme.dart';
import 'package:send_otp_firebase/utils/globals.dart';
import 'package:send_otp_firebase/utils/route_generator.dart';
import 'package:send_otp_firebase/utils/app_theme.dart';
import 'package:send_otp_firebase/utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const _MainApp());
}

class _MainApp extends StatelessWidget {
  const _MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FirebasePhoneAuthHandler Demo',
        scaffoldMessengerKey: Globals.scaffoldMessengerKey,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
