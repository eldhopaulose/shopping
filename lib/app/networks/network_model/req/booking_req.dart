class BookingReq {
  String? bookingDate;
  String? bookingTime;
  String? userId;
  List<String>? address;
  int? totalAmount;
  List<String>? product;

  BookingReq(
      {this.bookingDate,
      this.bookingTime,
      this.userId,
      this.address,
      this.totalAmount,
      this.product});

  BookingReq.fromJson(Map<String, dynamic> json) {
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    userId = json['userId'];
    address = json['address'].cast<String>();
    totalAmount = json['totalAmount'];
    product = json['product'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['userId'] = this.userId;
    data['address'] = this.address;
    data['totalAmount'] = this.totalAmount;
    data['product'] = this.product;
    return data;
  }
}
