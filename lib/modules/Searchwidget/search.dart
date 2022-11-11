import 'package:flutter/material.dart';
import 'package:news_app/models/newsmodel.dart';

import '../../shared/shared_component/component.dart';

class search extends StatelessWidget {
  List<Article> data;
  search(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data.length == 0
          ? Center(
              child: Text("no data to show"),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      greytext("mon,5th september 2022", 10),
                      blacktext("Search", 15),
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
                              data.length,
                              (index) => InkWell(
                                  child: explorewidget(
                                      data[index].urlToImage,
                                      data[index].title,
                                      data[index].author,
                                      data[index].publishedAt))))
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
