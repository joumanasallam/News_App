import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/newsmodel.dart';
import 'package:news_app/modules/home/cubit/states.dart';
import '../../../shared/shared_network/remote/diohelper.dart';



class HomeCubit extends Cubit<Homestates>{
HomeCubit():super(HomeInitState());

 

 static HomeCubit get(context)=>BlocProvider.of<HomeCubit>(context);
 final PageController pageController=PageController();
 
int pageno=0;
void onchangepage(int index){
  if (index<5)
  {pageno=index;}
  else if (index>=5)index=0;
  emit(HomeCurrentState());
}
 
 List photos=[
   "https://googleflutter.com/sample_image.jpg",
    "https://googleflutter.com/sample_image.jpg",
     "https://googleflutter.com/sample_image.jpg",
      "https://googleflutter.com/sample_image.jpg",
       "https://googleflutter.com/sample_image.jpg",
 ];
List titels=[
  "Apple Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up",
  "Samsung Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up",
  "OPPO Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up",
  "HAwaui Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up",
  "Apple Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up"
];

 NewsModel newsModel=NewsModel();
bool datacome=false;
void getHomeModel() {
    emit(HomeLoadingState());
    DioHelper.getData(
        url: "v2/everything",
        query: {
          "q":"bitcoin",
          "apiKey":"1039e6f90e5a4cb2a6193bcb7a1127b4"
        }
     
        ).then((value) {
            newsModel = NewsModel.fromJson(value.data);
          
          

         if (value.data==null){
           print("data dont come");
         }else
       
             print("data come");
             print(value.data);
            print(newsModel.articles![0].author);
            //  print(data["articles"][0]['urlToImage']);
     //   print(data["articles"].length);


           
      emit(HomeSusessState(newsModel));
       
    }).catchError((error) {
      debugPrint(error.toString());
      emit(HomeErorrState(error));
    });
  }
  

}