import 'package:cubit_bloc/blocs/color/color_bloc.dart';
import 'package:cubit_bloc/blocs/counting/counting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<CountingBloc>(
          create: (context) => CountingBloc(colorBloc: context.read<ColorBloc>()),
        ),
      ],
      child: MaterialApp(
        title: 'Cubit to Cubit basics',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Cubit 2 Cubit Demo')),
        backgroundColor: context.watch<ColorBloc>().state.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(
                  'Change Color',
                  style: TextStyle(fontSize: 24.0),
                ),
                onPressed: () {
                  // context.read<ColorCubit>().changeColor();
                  BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent());
                },
              ),
              SizedBox(height: 20.0),
              BlocBuilder<CountingBloc, CountingState>(
                builder: (context, state) {
                  return Text(
                    '${state.counting}',
                    style: TextStyle(
                      fontSize: 52.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                  //  '${context.watch<CountingCubit>().state.counting}',
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text(
                  'Increment Counter',
                  style: TextStyle(fontSize: 24.0),
                ),
                onPressed: () {
                  // context.read<CountingCubit>().changeCounting(incrementSize);
                  BlocProvider.of<CountingBloc>(context).add(ChangeCountingEvent());
                },
              ),
            ],
          ),
        ),
      );
   
  }
}
