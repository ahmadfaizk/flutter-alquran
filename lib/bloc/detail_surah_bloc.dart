import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/bloc/surah_event.dart';
import 'package:alquran/model/models.dart';
import 'package:alquran/repository/repository.dart';
import 'package:bloc/bloc.dart';

class DetailSurahBloc extends Bloc<BaseEvent, BaseState> {
  final QuranRepository repository;

  DetailSurahBloc({this.repository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is SurahEvent) {
      yield LoadingState();
      try {
        final Surah surah = await repository.getDetailSurah(event.number);
        yield SuccessState<Surah>(data: surah);
      } catch (error) {
        print(error);
        yield ErrorState(message: "Error");
      }
    }
  }
}
