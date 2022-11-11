import 'package:dio/dio.dart';

import '../../../models/newsmodel.dart';

abstract class Homestates {}


class  HomeInitState  extends  Homestates{}
class  HomeLoadingState  extends Homestates{}

class  HomeSusessState  extends Homestates{

   final NewsModel newsModel;


  HomeSusessState(this.newsModel);
}

class  HomeErorrState  extends  Homestates{
  final DioError error;

  HomeErorrState(this.error);
}
class  HomeCurrentState  extends Homestates{}