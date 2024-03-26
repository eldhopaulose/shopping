class BookingRes {
  String? error;
  Booking? booking;

  BookingRes({this.error, this.booking});

  BookingRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    booking =
        json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }
}

class Booking {
  String? bookingDate;
  String? bookingTime;
  String? userId;
  List<String>? address;
  int? totalAmount;
  List<String>? product;
  String? sId;
  String? bookingId;
  int? iV;

  Booking(
      {this.bookingDate,
      this.bookingTime,
      this.userId,
      this.address,
      this.totalAmount,
      this.product,
      this.sId,
      this.bookingId,
      this.iV});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    userId = json['userId'];
    address = json['address'].cast<String>();
    totalAmount = json['totalAmount'];
    product = json['product'].cast<String>();
    sId = json['_id'];
    bookingId = json['bookingId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['userId'] = this.userId;
    data['address'] = this.address;
    data['totalAmount'] = this.totalAmount;
    data['product'] = this.product;
    data['_id'] = this.sId;
    data['bookingId'] = this.bookingId;
    data['__v'] = this.iV;
    return data;
  }
}
