class CustomerUpdateAdressReq {
  String? error;
  String? name;
  String? address;
  String? state;
  String? district;
  String? pinCode;
  String? mobileNumber;
  String? country;

  CustomerUpdateAdressReq(
      {this.error,
      this.name,
      this.address,
      this.state,
      this.district,
      this.pinCode,
      this.mobileNumber,
      this.country});

  CustomerUpdateAdressReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    address = json['address'];
    state = json['state'];
    district = json['district'];
    pinCode = json['pinCode'];
    mobileNumber = json['mobileNumber'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['address'] = this.address;
    data['state'] = this.state;
    data['district'] = this.district;
    data['pinCode'] = this.pinCode;
    data['mobileNumber'] = this.mobileNumber;
    data['country'] = this.country;
    return data;
  }
}
