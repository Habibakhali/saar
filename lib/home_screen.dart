import 'package:elrayan/belux.dart';
import 'package:elrayan/saar.dart';
import 'package:elrayan/zord.dart';
import 'package:flutter/material.dart';

import 'category_model.dart';

class HomeScreen extends StatelessWidget {
static const String routeNAme='homeScreen';
List<String>listName=['زورد','ســـار','Belux','ريــفــا'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الريـــان'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listName.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,Zord.routeName,arguments: listName[index]);
                    },
                    child: CategoryModel(listName[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
