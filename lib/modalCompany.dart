class Company {
  final int? id; 
  final int companyID;// make id nullable
  final String coname;
  final String coadd;
  final String cophone;
  final String email;
  final String contactphone;
  // final String qnum;
  // final String qdate;


  Company({this.id, required this.coname, required this.coadd, required this.cophone,required this.email,required this.contactphone,required this.companyID});

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
       // only include id if it's not null
       'companyID' : companyID,
      'coname': coname,
      'coadd': coadd,
      'cophone': cophone,
      'email' : email,
      'contactphone' : contactphone,
      
      // 'qnum' : qnum,
      // 'qdate' : qdate,
      

    };
  }

  static Company fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id'],
      companyID: map['companyID'],
      coname: map['coname'],
      coadd: map['coadd'],
      cophone: map['cophone'],
      email: map['email'],
      contactphone: map['contactphone'],
      
      // gstnum: map['gstnum'],
      // qnum: map['qnum'],
      // qdate: map['qdate'],
      
    );
  }
}


