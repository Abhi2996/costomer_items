class Transactions{
    final int? id2; // make id nullable
    
    final String bname;
    final String badd;
    final String bacc;
    final String bifsc;
    
  
  

Transactions({this.id2,required this.bname, required this.badd, required this.bacc,required this.bifsc});

  Map<String, dynamic> toMap() {
    return {
      if (id2 != null) 'id': id2, // only include id if it's not null
      'bname': bname,
      'badd': badd,
      'bacc': bacc,
      'bifsc' :bifsc,
    };
  }

  static Transactions fromMap(Map<String, dynamic> map) {
    return Transactions(
      id2: map['id2'],
      bname : map['bname'],
      badd : map['badd'],
      bacc : map['bacc'],
      bifsc : map['bifsc'],



    );
  }
}