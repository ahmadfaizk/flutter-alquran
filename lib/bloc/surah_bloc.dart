import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/model/models.dart';
import 'package:alquran/repository/repository.dart';
import 'package:bloc/bloc.dart';

class SurahBloc extends Bloc<BaseEvent, BaseState> {
  QuranRepository repository;

  SurahBloc({this.repository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is FetchEvent) {
      yield LoadingState();
      try {
        final MultipleResponse<Surah> response =
            await repository.getListSurahs();
        if (response.code == 200) {
          yield SuccessState<List<Surah>>(data: response.data);
        } else {
          yield ErrorState(message: response.status);
        }
      } catch (error) {
        print(error);
        yield ErrorState(message: "No Connection");
      }
    }
  }
}
