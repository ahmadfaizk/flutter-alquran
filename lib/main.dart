import 'package:alquran/bloc/surah_bloc.dart';
import 'package:alquran/repository/repository.dart';
import 'package:alquran/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final QuranRepository repository = QuranRepository(
      remoteDataSource: RemoteDataSource(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SurahBloc>(
          create: (context) => SurahBloc(repository: repository),
        ),
      ],
      child: GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => Home(),
          ),
          GetPage(name: '/surah', page: () => Surah())
        ],
      ),
    );
  }
}
