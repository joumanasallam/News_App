import 'package:dio/dio.dart';

import '../../../models/newsmodel.dart';

abstract class Explorestates {}


class  EXInitState  extends  Explorestates{}
class  EXLoadingState  extends Explorestates{}
class  EXLoadingSearchState  extends Explorestates{}
class  EXCurrentState  extends Explorestates{}

class  EXSusessState  extends Explorestates{

   final NewsModel newsModel;


  EXSusessState(this.newsModel);
}

class  EXErorrState  extends Explorestates{
  final DioError error;

  EXErorrState(this.error);
}
class  HomeCurrentState  extends Explorestates{}