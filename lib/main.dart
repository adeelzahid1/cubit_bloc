import 'package:cubit_bloc/cubits/color/color_cubit.dart';
import 'package:cubit_bloc/cubits/counting/counting_cubit.dart';
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
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(),
        ),
        BlocProvider<CountingCubit>(
          create: (context) => CountingCubit(),
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
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
         if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.black) {
          context.read<CountingCubit>().changeCounting(-100);
          incrementSize = -100;
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Cubit 2 Cubit Demo')),
        backgroundColor: context.watch<ColorCubit>().state.color,
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
                  BlocProvider.of<ColorCubit>(context).changeColor();
                },
              ),
              SizedBox(height: 20.0),
              BlocBuilder<CountingCubit, CountingState>(
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
                  // context.read<CountingCubit>().changeCounting();
                  BlocProvider.of<CountingCubit>(context).changeCounting(incrementSize);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
