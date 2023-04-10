import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNumber = 5;
  int rigtNumber = 6;

  @override
  Widget build(BuildContext context) {
    print('builder ishtedi');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Тапшырма 05',
          style:
              TextStyle(color: Colors.white, fontFamily: 'Lobster-Regular.ttf'),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            leftNumber = Random().nextInt(7);
            context.read<DiceAppCubit>().leftNumber();
            rigtNumber = Random().nextInt(7);
            context.read<DiceAppCubit>().rigtNumber();
          },
          child: BlocBuilder<DiceAppCubit, int>(
            builder: (context, state) {
              print('blocBuilfer ishtedi');
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                          'assets/images/dice${leftNumber == 0 ? leftNumber = 1 : leftNumber}.png'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                          'assets/images/dice${rigtNumber == 0 ? rigtNumber = 1 : rigtNumber}.png'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class DiceAppCubit extends Cubit<int> {
  DiceAppCubit() : super(1);

  leftNumber() => emit(5);
  rigtNumber() => emit(6);
}
