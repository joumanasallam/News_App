import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/applayout.dart';
import 'package:news_app/modules/home/cubit/cubit.dart';
import 'package:news_app/modules/home/home.dart';
import 'package:news_app/shared/shared_component/component.dart';

import 'home/cubit/states.dart';
class splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
          child: BlocConsumer <HomeCubit, Homestates>(
             listener: (context, state) {
               if (state is HomeSusessState){
                 navigator(context, Applayout());
               }
               
             },
       builder:(context, state) { 
          var cubit = HomeCubit.get(context);
         return  Scaffold(
        body: Center(
            child: MaterialButton(onPressed: (){
                cubit.getHomeModel();
              
               
            },child:const  Text("click here")),
        ),
        
      );}
          ),
    );
  }
}