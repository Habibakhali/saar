import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elrayan/firebase/item_model.dart';

CollectionReference<ItemModel> getItemCollection(String collectionName){
  return FirebaseFirestore.instance.collection(collectionName).withConverter(
      fromFirestore: (snapShot,option)=>ItemModel.fromJson(snapShot.data()!),
      toFirestore: (item,option)=>item.toJson());
}

Future<void> addItemToFirebase(String collectionName, ItemModel item) {
 var collection= getItemCollection(collectionName);
 var doc=collection.doc();
 item.id=doc.id;
return doc.set(item);
}

Stream<QuerySnapshot<ItemModel>> getDataFromFirebase(String collectionName){
  return getItemCollection(collectionName).snapshots();
}


Future<void> deleteDataFromFirebase(String collectionName,String id)  {
  return getItemCollection(collectionName).doc(id).delete();
}
Future<void> updateDataFromFirebase(String collectionName,ItemModel i)  {
  return getItemCollection(collectionName).doc(i.id).update(i.toJson());
}