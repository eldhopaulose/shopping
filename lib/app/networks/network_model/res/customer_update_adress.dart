class CustomerUpdateAdressRes {
  String? error;
  UpdatedAddress? updatedAddress;

  CustomerUpdateAdressRes({this.error, this.updatedAddress});

  CustomerUpdateAdressRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    updatedAddress = json['updatedAddress'] != null
        ? new UpdatedAddress.fromJson(json['updatedAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.updatedAddress != null) {
      data['updatedAddress'] = this.updatedAddress!.toJson();
    }
    return data;
  }
}

class UpdatedAddress {
  String? sId;
  String? userId;
  String? name;
  String? address;
  String? state;
  String? district;
  String? pinCode;
  String? mobileNumber;
  String? country;
  int? iV;

  UpdatedAddress(
      {this.sId,
      this.userId,
      this.name,
      this.address,
      this.state,
      this.district,
      this.pinCode,
      this.mobileNumber,
      this.country,
      this.iV});

  UpdatedAddress.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    state = json['state'];
    district = json['district'];
    pinCode = json['pinCode'];
    mobileNumber = json['mobileNumber'];
    country = json['country'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['state'] = this.state;
    data['district'] = this.district;
    data['pinCode'] = this.pinCode;
    data['mobileNumber'] = this.mobileNumber;
    data['country'] = this.country;
    data['__v'] = this.iV;
    return data;
  }
}
