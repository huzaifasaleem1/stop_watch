import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stopwatch_provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String threeDigits(int n) => n.toString().padLeft(3, '0');

    final hours = twoDigits(d.inHours);
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    final millis = threeDigits(d.inMilliseconds.remainder(1000));

    return "$hours:$minutes:$seconds.$millis";
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
          centerTitle:true,title:  const Text("Stopwatch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
      body:
      Center(
        child: Consumer<StopwatchProvider>(
          builder: (context, stopwatch, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatDuration(stopwatch.elapsed),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,color: Colors.white
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: stopwatch.isRunning
                          ? stopwatch.stop
                          : stopwatch.start,
                      child: Text(stopwatch.isRunning ? "Stop" : "Start",style: TextStyle(color: Colors.black),),

                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: stopwatch.reset,
                      child: const Text("Reset",style: TextStyle(color: Colors.red),),

                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
