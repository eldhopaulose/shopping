class CustomerAddCartReq {
  String? error;
  String? productId;

  CustomerAddCartReq({this.error, this.productId});

  CustomerAddCartReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['productId'] = this.productId;
    return data;
  }
}
