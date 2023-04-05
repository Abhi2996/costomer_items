class Customer {
    final int? id1;
    final int customerId; // make id nullable
    final String cuname;
    final String cuadd;
    final String cuphone;
    
    final String itemID;
    final String itemName;
    final String quantity;
    //final String price;

    final double amt;
   
    final String cuemail;
  
  

  Customer({this.id1,required this.customerId, required this.cuname, required this.cuadd, required this.cuphone,required this.cuemail,required this.amt,required this.itemID,required this.itemName,required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      if (id1 != null) 'id': id1, 
      // only include id if it's not null
      'customerID' : customerId,
      'cuname': cuname,
      'cuadd': cuadd,
      'cuphone': cuphone,
      'cuemail' :cuemail,
      
      'itemID' : itemID,
      'itemName': itemName,
      'quantity': quantity,
      //'price': price,
      'amt' : amt,
    };
  }

  static Customer fromMap(Map<String, dynamic> map) {
    return Customer(

      id1: map['id1'],
      customerId: map['customerId'], 
      cuname: map['cuname'],
      cuadd: map['cuadd'],
      cuphone: map['cuphone'],
      cuemail: map['cuemail'],
      itemID: map['itemID'],
      itemName: map['itemName'],
      quantity: map['quantity'],
      //price: map['price'],
      
      amt: map['amt'],
     



    );
  }
}