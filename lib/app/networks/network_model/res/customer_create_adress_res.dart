class CustomerCreateAdressRes {
  String? error;
  NewAddress? newAddress;

  CustomerCreateAdressRes({this.error, this.newAddress});

  CustomerCreateAdressRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    newAddress = json['newAddress'] != null
        ? new NewAddress.fromJson(json['newAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.newAddress != null) {
      data['newAddress'] = this.newAddress!.toJson();
    }
    return data;
  }
}

class NewAddress {
  String? userId;
  String? name;
  String? address;
  String? state;
  String? district;
  String? pinCode;
  String? mobileNumber;
  String? sId;
  int? iV;

  NewAddress(
      {this.userId,
      this.name,
      this.address,
      this.state,
      this.district,
      this.pinCode,
      this.mobileNumber,
      this.sId,
      this.iV});

  NewAddress.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    state = json['state'];
    district = json['district'];
    pinCode = json['pinCode'];
    mobileNumber = json['mobileNumber'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['state'] = this.state;
    data['district'] = this.district;
    data['pinCode'] = this.pinCode;
    data['mobileNumber'] = this.mobileNumber;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
