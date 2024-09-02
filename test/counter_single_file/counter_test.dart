import 'package:flutter_test/flutter_test.dart';
import 'package:unite_testing_app/unite_testing/test_file/counter.dart';

void main() {
  group("Counter Testing Single File *** ", () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test("Test Counter increase +++", () {
      counter.increment();
      expect(counter.count, 1);
    });

    test("Test Counter decrease ---", () {
      counter.decrement();
      expect(counter.count, -1);
    });

    test("Test Counter Equivalent zero", () {
      counter.decrement();
      counter.increment();
      expect(counter.count, 0);
    });
  });
}
