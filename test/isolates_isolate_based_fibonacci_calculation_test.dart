import 'package:isolates_isolate_based_fibonacci_calculation/isolates_isolate_based_fibonacci_calculation.dart';
import 'package:test/test.dart';

void main() {
  group('Isolate-Based Fibonacci Calculation Tests', () {
    test('Calculates Fibonacci number correctly', () async {
      expect(await calculateFibonacciIsolate(10),
          equals(55)); // 10th Fibonacci number is 55
      expect(await calculateFibonacciIsolate(15),
          equals(610)); // 15th Fibonacci number is 610
    });

    test('Handles zero and one correctly', () async {
      expect(await calculateFibonacciIsolate(0),
          equals(0)); // 0th Fibonacci number is 0
      expect(await calculateFibonacciIsolate(1),
          equals(1)); // 1st Fibonacci number is 1
    });
  });
}
