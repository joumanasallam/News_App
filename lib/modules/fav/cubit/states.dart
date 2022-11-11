import 'package:dio/dio.dart';

import '../../../models/newsmodel.dart';

abstract class Favostates {}


class  FavoInitState  extends  Favostates{}
class  FavoLoadingState  extends Favostates{}
class  FavoCurrentState  extends Favostates{}
class  AlreadyAddState  extends Favostates{}

class  FavoSusessState  extends Favostates{

  
}

class  EXErorrState  extends Favostates{
  final DioError error;

  EXErorrState(this.error);
}
