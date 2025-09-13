import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

class StopwatchProvider extends ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();
  Ticker? _ticker;
  Duration _elapsed = Duration.zero;

  Duration get elapsed => _elapsed;
  bool get isRunning => _stopwatch.isRunning;

  void start() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _ticker ??= Ticker((_) {
        _elapsed = _stopwatch.elapsed;
        notifyListeners();
      });
      _ticker?.start();
    }
  }

  void stop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _ticker?.stop();
      notifyListeners();
    }
  }

  void reset() {
    _stopwatch.reset();
    _elapsed = Duration.zero;
    notifyListeners();
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }
}
