import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/Searchwidget/search.dart';
import 'package:news_app/modules/explore/explore.dart';
import 'package:news_app/modules/fav/favo.dart';
import 'package:news_app/modules/home/home.dart';
import 'package:news_app/shared/cubit/states.dart';

class AppCubit extends Cubit<Appstates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  List<Widget> screens = [Home(), explore(), favo(), search([])];

  var index = 0;

  void changeindex(int i) {
    index = i;
    emit(AppCurrentState());
  }

  final PageController pageController = PageController();
  int pageno = 0;
  void onchangepage(int index) {
    if (index < 5) {
      pageno = index;
    } else if (index >= 5) index = 0;
    emit(HomeCurrentState());
  }
}
