import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/model/surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.bloc<SurahBloc>().add(FetchEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Quran"),
      ),
      body: BlocConsumer<SurahBloc, BaseState>(
        listener: (context, state) {
          if (state is EmptyState) {
            context.bloc<SurahBloc>().add(FetchEvent());
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessState<List<Surah>>) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                var surah = state.data[index];
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
                              child:
                                  Center(child: Text(surah.number.toString())),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(surah.englishName),
                                  Text(surah.englishNameTranslation)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  surah.name,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      onTap: () => Get.toNamed(
                          'surah?name=${surah.englishName}&id=${surah.number}'),
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
                        context.bloc<SurahBloc>().add(FetchEvent()),
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
