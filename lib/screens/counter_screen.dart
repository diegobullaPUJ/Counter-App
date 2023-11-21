

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 15;

  void increase() {
    counter ++;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  void decrease(){
    counter --;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    const fontSize30 = TextStyle( fontSize: 30 );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CounterScreen'),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contador de clicks', style: fontSize30 ),
            Text( '$counter', style: fontSize30 ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  CustomFloatingActions(
        increaseFn: increase,
        resetFn: reset,
        decreaseFn: decrease,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function resetFn;
  final Function decreaseFn;

  const CustomFloatingActions({
    super.key, 
    required this.increaseFn, 
    required this.resetFn, 
    required this.decreaseFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          child: const Icon( Icons.exposure_minus_1 ),
          onPressed: () => decreaseFn(),
        ),

        const SizedBox( width: 20),

        FloatingActionButton(
          child: const Icon( Icons.restart_alt_outlined ),
          onPressed: () => resetFn(),
        ),

        const SizedBox( width: 20),

        FloatingActionButton(
          child: const Icon( Icons.exposure_plus_1 ),
          onPressed: () => increaseFn(),
        ),
      ],
    );
  }
}