import 'package:elrayan/firebase/firebase.dart';
import 'package:elrayan/firebase/item_model.dart';
import 'package:elrayan/shared_file/components.dart';
import 'package:flutter/material.dart';

class BottomSheetModel extends StatefulWidget {
  @override
  State<BottomSheetModel> createState() => _BottomSheetModelState();
  String arg;

  BottomSheetModel(this.arg);
}

class _BottomSheetModelState extends State<BottomSheetModel> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController controllerItem = TextEditingController();

  TextEditingController controllerQuantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('اضـف صنـف جديـد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(79, 111, 82, 1.0),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'IRANSans',
                  wordSpacing: 1.0,
                  height: 1.0,
                )),
            const SizedBox(
              height: 15,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controllerItem,
                      validator: (value) {
                        if (value?.trim() == '' || value == null) {
                          return "من فضلك ادخل اسـم الصنف";
                        }
                        return null;
                      },
                      cursorColor: const Color.fromRGBO(79, 111, 82, 1.0),
                      decoration: InputDecoration(
                        labelText: 'ادخــل اسـم الصنـف',
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(79, 111, 82, 1.0),
                              width: 2),
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(79, 111, 82, 1.0),
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controllerQuantity,
                      validator: (value) {
                        if (value?.trim() == '' || value == null) {
                          return "من فضلك ادخل الكمية";
                        }
                        return null;
                      },
                      cursorColor: const Color.fromRGBO(79, 111, 82, 1.0),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'الكـميـة',
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(79, 111, 82, 1.0),
                              width: 2),
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(79, 111, 82, 1.0),
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ItemModel item = ItemModel(
                                name: controllerItem.text,
                                quantity: controllerQuantity.text);
                            showLoading(context, 'تحميل...',
                                isCancellable: false);
                            addItemToFirebase(widget.arg, item).then((value) {
                              hideLoading(context);
                              showMessage(context, 'تم إضافة الصنف بنجاح', () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              });
                            });
                            print('item is added');
                          }
                        },
                        child: const Text(
                          "أضـــف",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
