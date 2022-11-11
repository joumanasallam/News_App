import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/shared/shared_component/component.dart';

import '../../models/newsmodel.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class favo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return FavoCubit();
      },
      child: BlocBuilder<FavoCubit, Favostates>(builder: (context, state) {
        var cubit = FavoCubit.get(context);
        List<Article> favo = cubit.favolist();
        cubit.emit(FavoCurrentState());

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  greytext("mon,5th september 2022", 10),
                  blacktext("Favorite", 15),
                  SizedBox(height: 10),
                  greytext("to remove double tap", 10),
                  SizedBox(height: 10),
                  GridView.count(
                      crossAxisCount: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 0.5,
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                          favo.length,
                          (index) => InkWell(
                              onDoubleTap: () {
                                cubit.removefromefavo(favo[index].title);
                                print("remove");
                              },
                              child: explorewidget(
                                  favo[index].urlToImage,
                                  favo[index].title,
                                  favo[index].author,
                                  favo[index].publishedAt))))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
