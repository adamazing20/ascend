import 'dart:async';

import 'package:rxdart/rxdart.dart';

class MountainListBloc {
  var _words = <String>[];
  Stream<List<String>> get words => wordSubject.stream;

  Sink<String> get wordsSink => wordSink.sink;

  final wordSubject = BehaviorSubject<List<String>>();
  final wordSink = StreamController<String>();

  MountainListBloc() {
    wordSubject.add(_words);
    wordSink.stream.listen((name) => {
          if (!_words.contains(name)) {
            _words.add(name),
            wordSubject.add(_words)
          }
        });
  }
}
