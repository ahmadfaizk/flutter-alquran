import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/model/models.dart';
import 'package:alquran/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.watch<ChapterBloc>().add(FetchEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Quran"),
      ),
      body: BlocConsumer<ChapterBloc, BaseState>(
        listener: (context, state) {
          if (state is EmptyState) {
            context.watch<ChapterBloc>().add(FetchEvent());
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessState<List<Chapter>>) {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                var chapter = state.data[index];
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            OctagonalContainer(
                              size: 45,
                              borderWidth: 3,
                              child: Text(chapter.chapterNumber.toString()),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8),
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
                      ),
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
                        context.watch<ChapterBloc>().add(FetchEvent()),
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
