import 'package:cubit_bloc/cubits/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
        return MaterialApp(
          title: 'Event Payload',
          debugShowCheckedModeBanner: false,
          theme: state.appTheme == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const MyHomePage(),
        );
      }),
         
      
      
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Center(
        child: ElevatedButton(
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Text(
                'Change Theme ${state.randomNum}',
                style: TextStyle(fontSize: 24.0),
              );
            },
          ),
          onPressed: () {
            final int randInt = Random().nextInt(1000);
            print('randInt: $randInt');
            context.read<ThemeCubit>().changeTheme(randInt);
          },
        ),
      ),
    );
  }
}
