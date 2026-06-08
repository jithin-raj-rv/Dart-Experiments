import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnin_bloc/bloc/banana%20caller/counter_bloc.dart';
import 'package:learnin_bloc/bloc/banana%20caller/counter_event.dart';
import 'package:learnin_bloc/bloc/banana%20caller/counter_state.dart';
import 'package:lottie/lottie.dart';


class BananaHome extends StatefulWidget {
  const BananaHome({super.key});

  @override
  State<BananaHome> createState() => _BananaHomeState();
}

class _BananaHomeState extends State<BananaHome> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    controller.duration = Duration(milliseconds: 2000);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Click Anywhere And Tommy will jump!')),
        shadowColor: Theme.of(context).colorScheme.outline,
      ),
      body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            counterBloc.add(IncrementCounter());
            counterBloc.add(JumpOnCount(controller));
            print(state.jumpCount);
          },
          child: Center(
            child: Stack(
              children: [
                Lottie.asset('lottie/Jumping Banano.json',
                  fit: BoxFit.fill,
                  controller: controller,
                ),
                Positioned(
                  top:-200,
                  left: 10,
                  right: 10,
                  bottom: 0,
                  child: Lottie.asset('lottie/Water waves.json',
                       fit: BoxFit.cover, width: double.infinity,height: double.infinity),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Text("Tommy will Jump ${state.jumpCount} times",textAlign: TextAlign.center,)
                ),
              ],
            ),
          ));
          },
        )
      );
  }
}