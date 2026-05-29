import 'package:go_router/go_router.dart';
import 'package:hrms/features/auth/presentation/pages/otp_verification_screen.dart';
import 'package:hrms/features/auth/presentation/pages/signin_screen.dart';
import 'package:hrms/features/navigation/presentation/pages/bottom_nav_shell.dart';
import 'package:hrms/features/splash/presentation/pages/splash_page.dart';

enum Routes {
  splashScreen,
  signInScreen,
  otpVerificationScreen,
  homeScreen,
  communityScreen,
  menuScreen,
  chatScreen,
  profileScreen,
}

GoRouter goRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: Routes.splashScreen.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/signin",
      name: Routes.signInScreen.name,
      builder: (context, state) => const SigninScreen(),
    ),
    GoRoute(
      path: "/otp-verification",
      name: Routes.otpVerificationScreen.name,
      builder: (context, state) {
        final phoneNumber = state.uri.queryParameters['phoneNumber'];
        return OtpVerificationScreen(
          phoneNumber: phoneNumber ?? '+6292121002200',
        );
      },
    ),
    GoRoute(
      path: "/home",
      name: Routes.homeScreen.name,
      builder: (context, state) => const BottomNavShell(initialIndex: 0),
    ),
    GoRoute(
      path: "/community",
      name: Routes.communityScreen.name,
      builder: (context, state) => const BottomNavShell(initialIndex: 1),
    ),
    GoRoute(
      path: "/menu",
      name: Routes.menuScreen.name,
      builder: (context, state) => const BottomNavShell(initialIndex: 2),
    ),
    GoRoute(
      path: "/chat",
      name: Routes.chatScreen.name,
      builder: (context, state) => const BottomNavShell(initialIndex: 3),
    ),
    GoRoute(
      path: "/profile",
      name: Routes.profileScreen.name,
      builder: (context, state) => const BottomNavShell(initialIndex: 4),
    ),
  ],
);
