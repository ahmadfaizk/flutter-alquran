import 'package:alquran/bloc/base_event.dart';

class ChapterEvent extends BaseEvent {
  final int id;

  const ChapterEvent({this.id});

  @override
  List<Object> get props => [id];
}
