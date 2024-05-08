import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elrayan/bottom_sheet_model.dart';
import 'package:elrayan/category_model.dart';
import 'package:elrayan/firebase/firebase.dart';
import 'package:elrayan/firebase/item_model.dart';
import 'package:flutter/material.dart';

import 'ittem.dart';

class Zord extends StatefulWidget {
static const String routeName='Zord';

  @override
  State<Zord> createState() => _ZordState();
}

class _ZordState extends State<Zord> {
late var arg;

  @override
  Widget build(BuildContext context) {
     arg= ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        bottomSheetfn(context);
      },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(arg),
      ),
      body: StreamBuilder<QuerySnapshot<ItemModel>>(
        stream: getDataFromFirebase(arg),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );}
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            var item=snapshot.data?.docs.map((item) => item.data()).toList()??[];
            return item.isEmpty?Center(
              child: Text('لا يوجد أي أصناف',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(79, 111, 82, 1.0)
              ),),
            ):ListView.builder(
              itemCount: item.length,
              itemBuilder: (context,index) {
                return Container(
                    margin: EdgeInsets.all(10),
                    child: Ittem(arg,item[index].name, item[index].quantity,item[index].id));
              },
            );
        },
      )
    );
  }

   bottomSheetfn(context){
    return showModalBottomSheet(
      isScrollControlled: true,
        backgroundColor:const Color.fromRGBO(245, 239, 230, 1.0),
        context: context,
    shape:const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      )),
    builder: (context){
      return  Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BottomSheetModel(arg),
    );});
  }
}
