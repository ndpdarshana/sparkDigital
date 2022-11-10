import 'dart:async';

import 'package:equatable/equatable.dart';

class BlocMessage extends Equatable {
  final Map<Type, dynamic> to;

  const BlocMessage(this.to);

  @override
  List<Object?> get props => [to];
}

class BlocMessagingService {
  static final BlocMessagingService _instance = BlocMessagingService._internal();
  late StreamController<BlocMessage> _streamController;

  factory BlocMessagingService() {
    return _instance;
  }

  BlocMessagingService._internal() {
    _streamController = StreamController.broadcast();
  }

  void publish(BlocMessage message) => _streamController.sink.add(message);

  Stream<BlocMessage>? subcribe() => _streamController.stream.asBroadcastStream();

  void close() => _streamController.close();
}
