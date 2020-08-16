import 'package:alquran/bloc/bloc.dart';
import 'package:alquran/model/surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    child: Card(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(surah.number.toString()),
                          ),
                          title: Text(surah.name),
                          subtitle: Text(surah.englishName),
                          autofocus: true,
                        ),
                      ],
                    )));
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
