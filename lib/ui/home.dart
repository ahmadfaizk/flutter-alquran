import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.bloc<ChapterBloc>().add(FetchEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Quran"),
      ),
      body: BlocConsumer<ChapterBloc, BaseState>(
        listener: (context, state) {
          if (state is EmptyState) {
            context.bloc<ChapterBloc>().add(FetchEvent());
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessState<List<Chapter>>) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                var chapter = state.data[index];
                return Container(
                    margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: GestureDetector(
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.green, width: 3),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                  child:
                                      Text(chapter.chapterNumber.toString())),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(chapter.nameSimple),
                                  Text(chapter.translatedName.name)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  chapter.nameArabic,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      onTap: () {
                        Get.toNamed(
                            '/surah?name=${chapter.nameSimple}&id=${chapter.chapterNumber}');
                      },
                    ));
              },
            );
          } else if (state is ErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  RaisedButton(
                    child: Text("Refresh"),
                    onPressed: () =>
                        context.bloc<ChapterBloc>().add(FetchEvent()),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
