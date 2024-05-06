import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/domain/counter.dart';

void main() {
  late Counter counter;

  setUp(() {
    counter = Counter();
  });

  group('Counter Class -', () {
    test(
        'Counter Class が初期化された時、count の値は 0 である',
        () {
      final val = counter.count;
      expect(val, 0);
    });

    test(
        'Counter Class の incrementCounter が呼び出された時、count の値は 1 である',
        () {
      counter.incrementCounter();
      final val = counter.count;

      equals(val, 1);
    });

    test(
        'Counter Class の decrementCounter が呼び出された時、count の値は 1 である',
        () {
      counter.decrementCounter();
      final val = counter.count;

      equals(val, -1);
    });

    test(
        'Counter Class の reset が呼び出された時、count の値は 0 である',
        () {
      counter.reset();

      final val = counter.count;

      equals(val, 0);
    });
  });

  // Post test
  // tearDown(() => null);
  // tearDownAll(() => null);

  // test -> tearDown -> test -> tearDown -> test -> tearDown
  // test -> teest -> test -> tearDown
}
