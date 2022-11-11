import 'package:flutter/material.dart';
import 'package:news_app/modules/explore/cubit/cubit.dart';

Widget greytext(String text, double fontsize) {
  return Text(text, style: TextStyle(fontSize: fontsize, color: Colors.grey));
}

Widget blacktext(String text, double fontsize) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontsize, color: Colors.black, fontWeight: FontWeight.bold),
    maxLines: 4,
    softWrap: true,
    overflow: TextOverflow.ellipsis,
  );
}

Widget newsslider(String? url, String? text) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 400,
      color: Colors.white,
      child: Column(
        children: [
          Container(
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage("$url")))),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              greytext("By s AADEETYA", 10),
              greytext("6 mins read", 10),
              greytext("2 hours ago", 10)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          blacktext('$text', 18),
        ],
      ),
    ),
  );
}

Widget newswidget(String? url, String? title, String? author, DateTime? date) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('$url'),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(child: blacktext("$title", 15)),
            ],
          ),
          greytext("$author", 10),
          greytext("$date", 10)
        ],
      ),
    ),
  );
}

Widget searchfield(dynamic fun) {
  return Stack(children: [
    SizedBox(
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: TextFormField(
          textAlign: TextAlign.left,
          onFieldSubmitted: fun,
          decoration: const InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: "search fo article",
          ),
        ),
      ),
    ),
  ]);
}

navigator(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

Widget icon(BuildContext context, int index, Function fun) {
  return InkWell(
    onTap: () {
      ExploreCubit.get(context).changehover(index);
      fun;
    },
    child: Container(
      height: 40,
      width: 70,
      alignment: Alignment.center,
      child: Text(
        ExploreCubit.get(context).bt[index].text,
        style: TextStyle(color: Colors.grey),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ExploreCubit.get(context).bt[index].istap
              ? Colors.black
              : Colors.white,
          border: Border.all(
              color: ExploreCubit.get(context).bt[index].istap
                  ? Colors.black
                  : Colors.grey)),
    ),
  );
}

Widget explorewidget(
    String? url, String? title, String? author, DateTime? date) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage('$url'), fit: BoxFit.fill),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: blacktext("$title", 18)),
              SizedBox(
                width: 5,
              ),
              greytext("$author", 10),
              SizedBox(
                width: 5,
              ),
              greytext("$date", 10),
            ],
          ),
        ),
      )
    ],
  );
}
