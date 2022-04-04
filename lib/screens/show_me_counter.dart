
import 'package:cubit_bloc/blocs/counting/counting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowMeCounter extends StatelessWidget {
  int incrementSize;
  ShowMeCounter({required this.incrementSize, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CountingBloc, CountingState>(
              builder: (context, state) {
                return Text(
                  '${state.counting}',
                  style: TextStyle(fontSize: 52.0),
                );
              },
            ),
          ),

          SizedBox(height: 40.0),
          Center(child: Text('${incrementSize}'),)

        ],
      ),
    );
  }
}