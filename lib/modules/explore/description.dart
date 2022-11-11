import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/newsmodel.dart';
import 'package:news_app/modules/fav/cubit/cubit.dart';
import 'package:news_app/modules/fav/cubit/states.dart';
import 'package:news_app/shared/shared_component/component.dart';

class description extends StatelessWidget {
  String? url = "";
  String? desc = "";
  String? title = "";
  String? author;
  DateTime? date;
  description(this.url, this.desc, this.title, this.author, this.date);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return FavoCubit();
      },
          child: BlocConsumer<FavoCubit,Favostates>(
        listener: (context, state) {
            if (state is AlreadyAddState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 10),
            content: Text('Already Added to favorite'),
          ));
          
        }
        },
            builder:(context,state){
              var cubit=FavoCubit.get(context);
              
              return Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  cubit.addtofavoloist(url, desc, title, author, date);
                
                },
                          child: Icon(
                  
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                
                ),
              )
            ],
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            title: Text(
              "Datails",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('$url'), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  child: Flexible(child: blacktext("$title", 20)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Flexible(child: greytext("$desc", 15)),
                )
              ],
            ),
          )),
        );}
      ),
    );
  }
}
