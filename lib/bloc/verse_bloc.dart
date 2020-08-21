import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/bloc/chapter_event.dart';
import 'package:alquran/model/models.dart';
import 'package:alquran/repository/repository.dart';
import 'package:bloc/bloc.dart';

class VerseBloc extends Bloc<BaseEvent, BaseState> {
  final QuranRepository repository;

  VerseBloc({this.repository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is ChapterEvent) {
      yield LoadingState();
      try {
        final Chapter chapter = await repository.getDetailChapter(event.id);
        yield SuccessState<Chapter>(data: chapter);
      } catch (error) {
        print(error);
        yield ErrorState(message: "Error");
      }
    }
  }
}
