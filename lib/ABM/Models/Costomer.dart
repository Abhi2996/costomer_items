class COSTOMER {
  final int? costomer_id;
  final String Cname;
  final String mobileno;
  final String email;
  List<Items>? itemslist;

  COSTOMER({
    this.costomer_id,
    required this.Cname,
    required this.mobileno,
    required this.email,
    this.itemslist,
  });

  //convert to map
  Map<String, dynamic> toMap() => {
        'costomer_id': costomer_id,
        'Cname': Cname,
        'mobileno': mobileno,
        'email': email,
      };

  //convert Map to Tenant
  factory COSTOMER.fromMap(Map<String, dynamic> map) => COSTOMER(
        costomer_id: map["costomer_id"],
        Cname: map["Cname"],
        mobileno: map["mobileno"],
        email: map["email"],
      );
}

class Items {
  final int? id;
  final String? iname;
  final int? qty;
  final double? price;

  final int? costomer_id;

  Items({
    this.id,
    this.iname,
    this.qty,
    this.price,
    this.costomer_id,
  });

  //convert to map
  Map<String, dynamic> RtoMap() => {
        'id': id,
        'iname': iname,
        'qty': qty,
        'price': price,
        'costomer_id': costomer_id,
      };

  //convert Map to BillReport
  factory Items.fromMap(Map<String, dynamic> map) => Items(
        id: map["id"],
        iname: map["iname"],
        qty: map["qty"],
        price: map["price"],
        costomer_id: map["costomer_id"],
      );
}


/*
//Tenant or flat owner
class Tenant {
  final int flat_no;
  final String name;

  final String door_no;
  final String mobileno;
  final String email;

  Tenant(
      {required this.flat_no,
      required this.name,
      required this.door_no,
      required this.mobileno,
      required this.email});

  //convert to map
  Map<String, dynamic> toMap() => {
        'flat_id': flat_no,
        'name': name,
        'door_no': door_no,
        'mobileno': mobileno,
        'email': email
      };
//convert Map to Tenant
  factory Tenant.toFm(Map<String, dynamic> map) => Tenant(
        flat_no: map["flat_id"],
        name: map["name"],
        door_no: map["door_no"],
        mobileno: map["mobileno"],
        email: map["email"],
      );
}
*/