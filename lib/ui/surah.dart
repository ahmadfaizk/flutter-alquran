import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SurahLayout extends StatelessWidget {
  final String _name = Get.parameters['name'];
  final int _id = int.parse(Get.parameters['id']);
  @override
  Widget build(BuildContext context) {
    context.bloc<DetailSurahBloc>().add(SurahEvent(number: _id));
    return Scaffold(
        appBar: AppBar(
          title: Text(_name),
        ),
        body: BlocConsumer<DetailSurahBloc, BaseState>(
          listener: (context, state) {
            if (state is EmptyState) {
              context.bloc<DetailSurahBloc>().add(SurahEvent(number: _id));
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SuccessState<Surah>) {
              var ayahs = state.data.ayahs;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: ayahs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      //margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Text(
                        ayahs[index].text,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 32),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
