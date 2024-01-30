class Cart {
  String? email;
  String? petImage;
  num? petPrice;
  String? petName;
  int? petId;
  int? quantity;
  num? petAge;
  num? petWeight;
  Cart({
    required this.email,
    required this.petId,
    required this.quantity,
    required this.petImage,
    required this.petName,
    required this.petPrice,
    required this.petAge,
    required this.petWeight,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'email': email,
      'petId': petId,
      'quantity': quantity,
      'petImage': petImage,
      'petName': petName,
      'petPrice': petPrice,
      'petAge': petAge,
      'petWeight': petWeight,
    };
    return map;
  }

  Cart.fromMap(Map<String, dynamic> map) {
    email = map["email"];
    petId = map["petId"];
    quantity = map["quantity"];
    petImage = map["petImage"];
    petName = map["petName"];
    petPrice = map["petPrice"];
    petAge = map["petAge"];
    petWeight = map["petWeight"];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'petId': petId,
      'quantity': quantity,
      'petImage': petImage,
      'petName': petName,
      'petPrice': petPrice,
      'petAge': petAge,
      'petWeight': petWeight,
    };
  }
}
