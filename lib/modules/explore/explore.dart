import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/newsmodel.dart';
import 'package:news_app/modules/Searchwidget/search.dart';
import 'package:news_app/modules/explore/cubit/cubit.dart';
import 'package:news_app/modules/explore/cubit/states.dart';
import 'package:news_app/modules/explore/description.dart';

import '../../shared/shared_component/component.dart';

class explore extends StatelessWidget {
  dynamic datainsearch;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ExploreCubit()..getexModel();
      },
      child:
          BlocConsumer<ExploreCubit, Explorestates>(listener: (context, state) {
        if (state is EXErorrState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 10),
            content: Text('check your connection!!'),
          ));
        }
      }, builder: (context, state) {
        var cubit = ExploreCubit.get(context);

        List<Article> list = cubit.datalist();

        return state is EXLoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is! EXErorrState
                ? SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            greytext("mon,5th september 2022", 10),
                            blacktext("Explore", 15),
                            const SizedBox(height: 10),
                            searchfield((value) {
                              datainsearch = value;
                              print(value);
                              print(datainsearch);
                              cubit.search(
                                  cubit.newsModel.articles!, datainsearch);
                              navigator(context, search(list));
                            }),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  icon(context, 0, () {}),
                                  icon(context, 1, () {}),
                                  icon(context, 2, () {}),
                                  icon(context, 3, () {}),
                                ],
                              ),
                            ),
                            GridView.count(
                                crossAxisCount: 1,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1 / 0.5,
                                scrollDirection: Axis.vertical,
                                children: List.generate(
                                    cubit.newsModel.articles!.length,
                                    (index) => InkWell(
                                        onTap: () {
                                          navigator(
                                              context,
                                              description(
                                                  cubit
                                                      .newsModel
                                                      .articles![index]
                                                      .urlToImage,
                                                  cubit
                                                      .newsModel
                                                      .articles![index]
                                                      .description,
                                                  cubit.newsModel
                                                      .articles![index].title,
                                                  cubit.newsModel
                                                      .articles![index].author,
                                                  cubit
                                                      .newsModel
                                                      .articles![index]
                                                      .publishedAt));
                                        },
                                        child: explorewidget(
                                            cubit.newsModel.articles![index]
                                                .urlToImage,
                                            cubit.newsModel.articles![index]
                                                .title,
                                            cubit.newsModel.articles![index]
                                                .author,
                                            cubit.newsModel.articles![index]
                                                .publishedAt))))
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text("check your connection"),
                  );
      }),
    );
  }
}
