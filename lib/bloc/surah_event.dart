import 'package:alquran/bloc/base_event.dart';

class SurahEvent extends BaseEvent {
  final int number;

  SurahEvent({this.number});

  @override
  List<Object> get props => [number];
}
