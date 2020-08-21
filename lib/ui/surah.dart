import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/bloc/chapter_event.dart';
import 'package:alquran/bloc/verse_bloc.dart';
import 'package:alquran/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SurahLayout extends StatelessWidget {
  final String _name = Get.parameters['name'];
  final int _id = int.parse(Get.parameters['id']);
  @override
  Widget build(BuildContext context) {
    context.bloc<VerseBloc>().add(ChapterEvent(id: _id));
    return Scaffold(
        appBar: AppBar(
          title: Text(_name),
        ),
        body: BlocConsumer<VerseBloc, BaseState>(
          listener: (context, state) {
            if (state is EmptyState) {
              context.bloc<VerseBloc>().add(ChapterEvent(id: _id));
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SuccessState<Chapter>) {
              var verses = state.data.verses;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        children: [Text(state.data.nameSimple)],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: verses.length,
                        itemBuilder: (context, index) {
                          var verse = verses[index];
                          return Container(
                            margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.grey[200]),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green[700]),
                                        child: Center(
                                          child: Text(
                                            verse.verseNumber.toString(),
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.green[300],
                                      ),
                                      Icon(Icons.share,
                                          color: Colors.green[300]),
                                      Icon(Icons.bookmark_border,
                                          color: Colors.green[300])
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Text(
                                    verse.textMadani,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontFamily: 'Uthman Naskh'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
