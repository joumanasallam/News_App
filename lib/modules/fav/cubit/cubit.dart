import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/newsmodel.dart';
import 'package:news_app/modules/explore/cubit/states.dart';
import 'package:news_app/modules/fav/cubit/states.dart';

List<Article> favo = [];

class FavoCubit extends Cubit<Favostates> {
  FavoCubit() : super(FavoInitState());

  static FavoCubit get(context) => BlocProvider.of<FavoCubit>(context);
 bool x=true;
  void addtofavoloist(
    String? url,
    String? desc,
    String? title,
    String? author,
    DateTime? date,
  ) {
    
    for (int i=0;i<favo.length;i++){
     
      if (favo[i].title==title) {
        print("mawgoood");
      x=false;}
    }
    if (x==false) {
     print("already added");
     emit(AlreadyAddState ());
    } else {
      favo.add(Article(
          author: author,
          description: desc,
          publishedAt: date,
          urlToImage: url,
          title: title));
            print("opject add to favo list");
    }
    emit(FavoCurrentState());

    print(favo.length);
  }

  void removefromefavo(String? data){
    for(int i=0;i<favo.length;i++){
      if(favo[i].title==data) {favo.removeAt(i); print("done");}
    }
    print(favo.length);
    emit(FavoCurrentState());

  }

  List<Article> favolist() {
    return favo;
  }
}
