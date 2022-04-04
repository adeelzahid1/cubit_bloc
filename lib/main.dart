import 'package:cubit_bloc/blocs/color/color_bloc.dart';
import 'package:cubit_bloc/blocs/counter/counter_bloc.dart';
import 'package:cubit_bloc/blocs/counting/counting_bloc.dart';
import 'package:cubit_bloc/screens/show_me_counter.dart';
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
          create: (context) => CountingBloc(),
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
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, colorState) {
        if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
        context.read<CountingBloc>().add(ChangeCountingEvent(incrementSize: incrementSize));
      }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Bloc 2 Bloc bloc_listner')),
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
                  context.read<CountingBloc>().add(ChangeCountingEvent(incrementSize: incrementSize));
                  // BlocProvider.of<CountingBloc>(context).add(ChangeCountingEvent());
                },
              ),

              SizedBox(height: 40.0),

              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return BlocProvider.value(
                      value: context.read<CountingBloc>(),
                      child: ShowMeCounter(incrementSize: context.watch<CountingBloc>().state.counting),
                    );
                  }),
                );
              },
              child: Text(
                'Go to Counter Page',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20.0),

            
            ],
          ),
        ),
      ),
    );
  }
}