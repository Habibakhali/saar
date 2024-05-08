import 'package:elrayan/firebase/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'bottom_sheet_model.dart';
import 'edit_item.dart';
import 'firebase/firebase.dart';

class Ittem extends StatefulWidget {
  String category;
  String name;
  String quantity;
  String id;

  Ittem(this.category, this.name, this.quantity, this.id);

  @override
  State<Ittem> createState() => _IttemState();
}

class _IttemState extends State<Ittem> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Slidable(
            startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children:  [
            SlidableAction(
              borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
              onPressed: (context){
                deleteDataFromFirebase(widget.category,widget.id);
              },
              backgroundColor: Color(0xFFE9CEB5),
              foregroundColor:Color.fromRGBO(79, 111, 82, 1.0),
              icon: Icons.delete,
              label: 'مـسح',
            ),
            SlidableAction(
              onPressed: (context){
                bottomSheetfn(context);
              },
              backgroundColor: Color(0xFFD1CBB8),
              foregroundColor: Color.fromRGBO(79, 111, 82, 1.0),
              icon: Icons.edit,
              label: 'تعديل',
            ),
          ],
        ),
        child: Container(
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
                  Text(widget.name,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(79, 111, 82, 1.0)
                  ),),
                  Row(
                    children: [
                      Icon(Icons.add_circle_outline,color: Color.fromRGBO(79, 111, 82, 1.0),),
                      SizedBox(width: 5),
                      Text(widget.quantity.toString()),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
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
            child: EditItem(widget.category,
                widget.name,
                widget.quantity,
                widget.id),
          );});
  }
}
