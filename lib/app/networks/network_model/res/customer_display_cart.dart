class CustomerDisplayCartRes {
  String? error;
  List<Cart>? cart;
  int? totalPrice;

  CustomerDisplayCartRes({this.error, this.cart, this.totalPrice});

  CustomerDisplayCartRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

class Cart {
  String? sId;
  String? customerId;
  String? productId;
  String? createdAt;
  int? iV;
  Product? product;

  Cart(
      {this.sId,
      this.customerId,
      this.productId,
      this.createdAt,
      this.iV,
      this.product});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerId = json['customerId'];
    productId = json['productId'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['customerId'] = this.customerId;
    data['productId'] = this.productId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? sId;
  String? name;
  List<String>? image;
  String? about;
  String? price;
  String? categories;
  String? discount;
  int? iV;

  Product(
      {this.sId,
      this.name,
      this.image,
      this.about,
      this.price,
      this.categories,
      this.discount,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'].cast<String>();
    about = json['about'];
    price = json['price'];
    categories = json['categories'];
    discount = json['discount'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['about'] = this.about;
    data['price'] = this.price;
    data['categories'] = this.categories;
    data['discount'] = this.discount;
    data['__v'] = this.iV;
    return data;
  }
}
