import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/cubit/cubit.dart';

class Applayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AppCubit();
      },
      child: BlocConsumer<AppCubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            body: cubit.screens[cubit.index],
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                currentIndex: cubit.index,
                onTap: (index) {
                  cubit.changeindex(index);
                },
                elevation: 0,
                iconSize: 20,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
                ]),
          );
        },
      ),
    );
  }
}
