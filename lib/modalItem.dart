class Item {
  final int? id3;
  String itemid;
   // make id nullable
  String iname;
  int quantity;
  double price;
  String custname;
  String custID;

  Item(
      {this.id3,
      required this.itemid,
      required this.iname,
      required this.quantity,
      required this.price,
      required this.custname,
      required this.custID,
      
      });

  Map<String, dynamic> toMap() {
    return {
      if (id3 != null) 'id': id3, 
      'itemid' : itemid,
      // only include id if it's not null
      'iname': iname,
      'quantity': quantity,
      'price': price,
      'custname': custname,
      'custID': custID,
    };
  }

  static Item fromMap(Map<String, dynamic> map) {
    return Item(
      id3: map['id3'],
      itemid: map['itemid'],
      iname: map['iname'],
      quantity: map['quantity'],
      price: map['price'],
       custname: map['custname'],
       custID: map['custID'],

    );
  }
}
