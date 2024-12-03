import 'package:flutter/material.dart';
import 'package:home/sign_in/login.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Chuyển hướng sau 3 giây
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logoSplash.png',
              fit: BoxFit.contain,
              width: 240, // Điều chỉnh kích thước ảnh theo ý muốn
              height: 90, // Điều chỉnh kích thước ảnh theo ý muốn
            ),
          ),
        ],
      ),
    );
  }

}
