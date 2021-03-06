import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/bloc/verse_bloc.dart';
import 'package:alquran/repository/repository.dart';
import 'package:alquran/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final QuranRepository repository = QuranRepository(
      remoteDataSource: RemoteDataSource(httpClient: http.Client()),
      localDataSouce: LocalDataSouce());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SurahBloc>(
          create: (context) => SurahBloc(repository: repository),
        ),
        BlocProvider<DetailSurahBloc>(
          create: (context) => DetailSurahBloc(repository: repository),
        ),
        BlocProvider<ChapterBloc>(
          create: (context) => ChapterBloc(repository: repository),
        ),
        BlocProvider<VerseBloc>(
          create: (context) => VerseBloc(repository: repository),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => SplashLayout(),
          ),
          GetPage(
            name: '/home',
            page: () => Home(),
          ),
          GetPage(name: '/surah', page: () => SurahLayout())
        ],
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.green[400],
            accentColor: Colors.greenAccent,
            primaryColorDark: Colors.green[700],
            textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
      ),
    );
  }
}
