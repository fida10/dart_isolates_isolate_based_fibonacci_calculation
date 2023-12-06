/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/isolates_isolate_based_fibonacci_calculation_base.dart';

/*
Practice Question 1: Isolate-Based Fibonacci Calculation

Task:

Calculate the nth Fibonacci number in a separate isolate. 
Pass the value of n to the new isolate as an argument and return the result to the main isolate.
 */

import 'dart:isolate';

//0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
void fibonacciAsIsolate(List<Object> params) {
  SendPort sendPort = params[0] as SendPort;
  int n = params[1] as int;

  if (n > 1) {
    int first = 0;
    int next = 1;
    int current = 0;

    for (var i = 1; i < n; i++) {
      current = first + next;
      first = next;
      next = current;
    }

    sendPort.send(current);
  } else {
    sendPort.send(n);
  }
}

Future<int> calculateFibonacciIsolate(int n) async {
  final receivePort = ReceivePort();

  final newIsolate = await Isolate.spawn<List<Object>>(
      fibonacciAsIsolate, [receivePort.sendPort, n, "hello", true]);

  final ans = (await receivePort.first);

  receivePort.close();
  newIsolate.kill();

  return ans;
}
