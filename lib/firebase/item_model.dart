class ItemModel{
  String id;
  String name;
  String quantity;

  ItemModel({this.id='',required this.name,required this.quantity});

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'quantity':quantity
    };}
  ItemModel.fromJson(Map<String, dynamic> json):this(
    id:json['id'],
    name:json['name'],
    quantity:json['quantity']
  );
}