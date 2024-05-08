import 'package:flutter/material.dart';

class CategoryModel extends StatelessWidget {
String name;
  CategoryModel(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(232, 223, 202, 1.0)
      ),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 50,
            margin: EdgeInsets.all( 10),
            color: Color.fromRGBO(79, 111, 82, 1.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(79, 111, 82, 1.0)
              ),),
               Text('',style: TextStyle(fontSize: 1),)
            ],
          ),
        ],
      ),
    );
  }
}
