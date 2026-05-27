import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return const Center(child: Text('Auth Page'));
        },
      ),
    );
  }
}
