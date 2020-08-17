import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/model/models.dart';
import 'package:alquran/repository/repository.dart';
import 'package:bloc/bloc.dart';

class ChapterBloc extends Bloc<BaseEvent, BaseState> {
  QuranRepository repository;

  ChapterBloc({this.repository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is FetchEvent) {
      yield LoadingState();
      try {
        final List<Chapter> response = await repository.getListChapters();
        yield SuccessState<List<Chapter>>(data: response);
      } catch (error) {
        print(error);
        yield ErrorState(message: "Error");
      }
    }
  }
}
