import 'package:cevreci_cocuk/utils/app_colors.dart';
import 'package:cevreci_cocuk/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleGoogleSignIn() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (error) {
      print("Google Giriş Hatası: $error");
    }
  }

  void _handleLogin() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text;

    final prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('saved_username');
    String? savedPassword = prefs.getString('saved_password');

    if (username == savedUsername && password == savedPassword) {
      await prefs.setBool('isLoggedIn', true);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(AppStrings.loginErrorTitle),
          content: Text(AppStrings.loginErrorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppStrings.okButton),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background_login.png',
            fit: BoxFit.cover,
          ),
          Container(color: AppColors.container),
          //AppColors.loginInTextC
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppStrings.appTitle,
                    style: TextStyle(
                      color: AppColors.loginTextColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                 TextField(
  controller: _usernameController,
  decoration: InputDecoration(
    hintText: AppStrings.usernameHint,
    fillColor: AppColors.loginTextColor,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.enableBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.focusBorder),
    ),
  ),
),

                 SizedBox(height: 16),
TextField(
  controller: _passwordController,
  obscureText: true,
  decoration: InputDecoration(
    hintText: AppStrings.passwordHint,
    fillColor: AppColors.loginTextColor,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.enableBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.focusBorder),
    ),
  ),
),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _handleLogin,
                    child: Text(AppStrings.loginButton),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      AppColors.savedButtonColors,
                      foregroundColor: AppColors.loginInTextC,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _handleGoogleSignIn,
                    icon: Image.asset('assets/google_icon.png', height: 24),
                    label: Text(AppStrings.googleLoginButton),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.loginTextColor,
                      foregroundColor: AppColors.loginInTextC,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 12),
ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  },
  child: Text(AppStrings.registerButton),
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.loginTextColor,
    foregroundColor: AppColors.loginInTextC,
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}