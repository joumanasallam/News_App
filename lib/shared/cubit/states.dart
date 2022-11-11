import 'package:dio/dio.dart';
import 'package:news_app/models/newsmodel.dart';

abstract class Appstates {}


class AppInitState  extends Appstates{}
class AppLoadingState  extends Appstates{}
class AppErorrState  extends Appstates{}
class AppCurrentState  extends Appstates{}
class  HomeInitState  extends  Appstates{}
class  HomeLoadingState  extends Appstates{}
class  HomeSusessState  extends Appstates{

   final NewsModel newsModel;


  HomeSusessState(this.newsModel);
}

class  HomeErorrState  extends  Appstates{
  final DioError error;

  HomeErorrState(this.error);
}
class  HomeCurrentState  extends Appstates{}