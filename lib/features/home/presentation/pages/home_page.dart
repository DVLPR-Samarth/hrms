import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return const Center(child: Text('Home Page'));
        },
      ),
    );
  }
}
