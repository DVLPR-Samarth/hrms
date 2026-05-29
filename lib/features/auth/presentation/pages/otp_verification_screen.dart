import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hrms/core/constants/app_colors.dart';
import 'package:hrms/core/constants/router.dart';
import 'package:hrms/core/widgets/primary_button.dart';
import 'package:hrms/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hrms/features/auth/presentation/widgets/otp_input_box.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, this.phoneNumber = '+6292121002200'});

  final String phoneNumber;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeef4ff),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final isCompact = height < 700;
          final cardHeight = height * (isCompact ? .66 : .58);
          final horizontalPadding = constraints.maxWidth < 360 ? 18.0 : 24.0;

          return Stack(
            children: [
              Container(
                height: height * .48,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff8ec5ff), Color(0xffb89cff)],
                  ),
                ),
              ),
              Positioned(top: 118, left: -46, child: _circle(120)),
              Positioned(top: 156, right: -38, child: _circle(92)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: cardHeight.clamp(410, 500).toDouble(),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    isCompact ? 42 : 56,
                    horizontalPadding,
                    isCompact ? 16 : 24,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Sign In Phone Number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff111827),
                            ),
                          ),
                          SizedBox(height: isCompact ? 10 : 18),
                          Text(
                            'Sign in code has been sent to ${widget.phoneNumber}, check\nyour inbox to continue the sign in process.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.25,
                              color: Color(0xff374151),
                            ),
                          ),
                          SizedBox(height: isCompact ? 12 : 20),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(6, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: index == 5 ? 0 : 8,
                                  ),
                                  child: OtpInputBox(
                                    controller: _controllers[index],
                                    focusNode: _focusNodes[index],
                                    previousFocusNode: index == 0
                                        ? null
                                        : _focusNodes[index - 1],
                                    nextFocusNode: index == 5
                                        ? null
                                        : _focusNodes[index + 1],
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: isCompact ? 8 : 14),
                          const Text(
                            '00:25',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff111827),
                            ),
                          ),
                          SizedBox(height: isCompact ? 8 : 14),
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Text(
                                "Haven't received the sign in code? ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff111827),
                                ),
                              ),
                              _LinkText(
                                text: 'Resend it.',
                                onTap: () => context.read<AuthBloc>().add(
                                  const AuthOtpResendRequested(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: isCompact ? 8 : 14),
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              _LinkText(
                                text: 'Email for OTP',
                                onTap: () => context.read<AuthBloc>().add(
                                  const AuthEmailOtpRequested(),
                                ),
                              ),
                              const Text(
                                ' Or ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff111827),
                                ),
                              ),
                              _LinkText(
                                text: 'Call for OTP',
                                onTap: () => context.read<AuthBloc>().add(
                                  const AuthCallOtpRequested(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          PrimaryButton(
                            label: 'Submit',
                            height: isCompact ? 48 : 52,
                            onPressed: () {
                              final otp = _controllers
                                  .map((e) => e.text)
                                  .join();

                              context.read<AuthBloc>().add(
                                AuthOtpSubmitted(otp: otp),
                              );

                              context.goNamed(Routes.homeScreen.name);
                            },
                          ),
                          SizedBox(height: isCompact ? 12 : 22),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: 'Sign in with different method ',
                              style: TextStyle(
                                color: Color(0xff111827),
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Here.',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * .42 - 36,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      color: const Color(0xff2f6f9f),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(.14),
                          blurRadius: 14,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: AppColors.white,
                      size: 34,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _circle(double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white.withOpacity(.15),
      ),
    );
  }
}

class _LinkText extends StatelessWidget {
  const _LinkText({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
