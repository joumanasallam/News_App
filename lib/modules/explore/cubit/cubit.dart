import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/explore/cubit/states.dart';
import '../../../models/newsmodel.dart';
import '../../../shared/shared_network/remote/diohelper.dart';

List<Article> newlist = [];

class ExploreCubit extends Cubit<Explorestates> {
  ExploreCubit() : super(EXInitState());

  static ExploreCubit get(context) => BlocProvider.of<ExploreCubit>(context);

  List<button> bt = [
    button(text: "ALL", istap: true),
    button(text: "Polices", istap: false),
    button(text: "Sports", istap: false),
    button(text: "Health", istap: false),
  ];

  void changehover(int i) {
    bt[i].istap = !bt[i].istap;

    emit(EXCurrentState());
  }

  NewsModel newsModel = NewsModel();

  void getexModel() {
    emit(EXLoadingState());
    DioHelper.getData(url: "v2/everything", query: {
      "q": "bitcoin",
      "apiKey": "1039e6f90e5a4cb2a6193bcb7a1127b4"
    }).then((value) {
      newsModel = NewsModel.fromJson(value.data);

      if (value.data == null) {
        print("data dont come");
      } else
        print("data come");
      print(value.data);
      print(newsModel.articles![0].author);

      emit(EXSusessState(newsModel));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(EXErorrState(error));
    });
  }

  void search(List<Article> list, String key) {
    newlist.clear();
    emit(EXLoadingState());
    for (int i = 0; i < list.length; i++) {
      print("wait");
      if (list[i].title!.contains(key)) {
        newlist.add(list[i]);
        print("value added");
      }
    }
    print(newlist.length);
    emit(EXSusessState(newsModel));
  }

  List<Article> datalist() {
    print(newlist.length);
    return newlist;
  }
}

class button {
  String text;
  bool istap;
  button({required this.text, required this.istap});
}
