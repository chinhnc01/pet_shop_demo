class Bill {
  int? billId;
  int? billTotal;
  int? checkoutTime;
  List<dynamic>? list;
  int? quantity;
  String? status;
  String? userEmail;
  Bill({
    required this.billId,
    required this.billTotal,
    required this.checkoutTime,
    required this.list,
    required this.quantity,
    required this.status,
    required this.userEmail,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'billId': billId,
      'billTotal': billTotal,
      'checkoutTime': checkoutTime,
      'list': list,
      'quantity': quantity,
      'status': status,
      'userEmail': userEmail,
    };
    return map;
  }

  Bill.fromJson(Map<dynamic, dynamic> json) {
    billId = json['billId'];
    billTotal = json['billTotal'];
    checkoutTime = json['checkoutTime'];
    // list != null ? Bill.fromJson(json['list']) : null;
    if (json['\$list'] != null) {
      list = <Null>[];
      json['\$list'].forEach((v) {
        list!.add(v);
      });
    }
    quantity = json['quantity'];
    status = json['status'];
    userEmail = json['userEmail'];
  }

  Bill.fromMap(Map<String, dynamic> map) {
    billId = map["billId"];
    billTotal = map["billTotal"];
    checkoutTime = map["checkoutTime"];
    list = map["list"];
    quantity = map["quantity"];
    status = map["status"];
    userEmail = map["userEmail"];
  }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['billId'] = billId;
  //   data['billTotal'] = billTotal;
  //   data['checkoutTime'] = checkoutTime;
  //   if (list != null) {
  //     data['list'] = list!.toJson();
  //   }
  //   data['quantity'] = quantity;
  //   data['status'] = status;
  //   data['userEmail'] = userEmail;

  //   return data;
  // }
}
