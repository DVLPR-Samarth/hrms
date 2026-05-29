import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hrms/core/constants/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..forward();
    Future.delayed(Duration(seconds: 2), () {
      goRouter.goNamed(Routes.signInScreen.name);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffcfe8ff), Color(0xfff4efff), Color(0xffdccbff)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(top: -100, left: -80, child: _bgCircle(300)),

            Positioned(bottom: -120, right: -100, child: _bgCircle(320)),

            Center(
              child: FadeTransition(
                opacity: fade,
                child: ScaleTransition(
                  scale: Tween(begin: .8, end: 1.0).animate(fade),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: const LinearGradient(
                            colors: [Color(0xff2ea7ff), Color(0xff9b5cff)],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "M",
                            style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      const Text(
                        "Mine HR Solution",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1b2560),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Manage. Empower. Grow Together.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(.55),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 45,
              left: 0,
              right: 0,
              child: Column(
                children: const [
                  Text(
                    "Powered by",
                    style: TextStyle(fontSize: 15, color: Color(0xff5c5c5c)),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Mine HR Solution",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff5b6cff),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bgCircle(double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(.15),
      ),
    );
  }
}
