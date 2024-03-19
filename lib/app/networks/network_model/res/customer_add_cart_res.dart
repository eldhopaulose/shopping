class CustomerAddCartRes {
  String? error;
  NewCart? newCart;

  CustomerAddCartRes({this.error, this.newCart});

  CustomerAddCartRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    newCart =
        json['newCart'] != null ? new NewCart.fromJson(json['newCart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.newCart != null) {
      data['newCart'] = this.newCart!.toJson();
    }
    return data;
  }
}

class NewCart {
  String? customerId;
  String? productId;
  String? sId;
  String? createdAt;
  int? iV;

  NewCart({this.customerId, this.productId, this.sId, this.createdAt, this.iV});

  NewCart.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    productId = json['productId'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['productId'] = this.productId;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
