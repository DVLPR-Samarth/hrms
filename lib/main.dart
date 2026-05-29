import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/core/constants/router.dart';
import 'package:hrms/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hrms/features/splash/presentation/bloc/splash_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HrMs());
}

class HrMs extends StatelessWidget {
  const HrMs({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          routerConfig: goRouter,

          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
