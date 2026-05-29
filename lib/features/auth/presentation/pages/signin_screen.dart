import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hrms/core/constants/router.dart';
import 'package:hrms/core/widgets/primary_button.dart';
import 'package:hrms/features/auth/presentation/bloc/auth_bloc.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthOtpVerificationReady) {
          context.pushNamed(
            Routes.otpVerificationScreen.name,
            queryParameters: {'phoneNumber': state.phoneNumber},
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffeef4ff),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            /// TOP GRADIENT
            Container(
              height: MediaQuery.of(context).size.height * .42,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff8ec5ff), Color(0xffb89cff)],
                ),
              ),
            ),

            /// BG CIRCLES
            Positioned(top: 120, left: -50, child: _circle(120)),

            Positioned(top: 150, right: -40, child: _circle(90)),

            /// MAIN CARD
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .74,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1d2452),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Center(
                        child: Text(
                          "Welcome To Mine HR",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ),

                      const SizedBox(height: 35),

                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "INA",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),

                            const Icon(Icons.keyboard_arrow_down_rounded),

                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              width: 1,
                              height: 24,
                              color: Colors.black12,
                            ),

                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "+62 821 0000 0000",
                                  hintStyle: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      PrimaryButton(
                        label: "Sign In",
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            const AuthSignInRequested(
                              phoneNumber: '+6292121002200',
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "OR",
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                        ],
                      ),

                      const SizedBox(height: 28),

                      _socialButton(icon: "G", text: "Sign In with Google"),

                      const SizedBox(height: 16),

                      _socialButton(icon: "", text: "Sign In with Apple"),

                      const SizedBox(height: 30),

                      Center(
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign Up Here",
                                style: TextStyle(
                                  color: Color(0xff5b6cff),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (_) {},
                            activeColor: const Color(0xff6b63ff),
                          ),
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black54,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "Please confirm that you agree to our ",
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(color: Color(0xff5b6cff)),
                                  ),
                                  TextSpan(text: ", Terms & Conditions "),
                                  TextSpan(
                                    text: "and Cancellation & Refund Policy.",
                                    style: TextStyle(color: Color(0xff5b6cff)),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }

  static Widget _circle(double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(.15),
      ),
    );
  }

  static Widget _socialButton({required String icon, required String text}) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xff8da2ff)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
