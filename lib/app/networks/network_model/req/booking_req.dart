class BookingReq {
  String? error;
  String? name;
  String? bookingDate;
  String? bookingTime;
  String? userId;
  List<String>? address;
  int? totalAmount;
  List<String>? product;

  BookingReq(
      {this.error,
      this.name,
      this.bookingDate,
      this.bookingTime,
      this.userId,
      this.address,
      this.totalAmount,
      this.product});

  BookingReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    userId = json['userId'];
    address = json['address'].cast<String>();
    totalAmount = json['totalAmount'];
    product = json['product'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['userId'] = this.userId;
    data['address'] = this.address;
    data['totalAmount'] = this.totalAmount;
    data['product'] = this.product;
    return data;
  }
}
