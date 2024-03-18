class CustomerGetAdressRes {
  String? error;
  List<Address>? address;

  CustomerGetAdressRes({this.error, this.address});

  CustomerGetAdressRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(new Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
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

  Address(
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

  Address.fromJson(Map<String, dynamic> json) {
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
