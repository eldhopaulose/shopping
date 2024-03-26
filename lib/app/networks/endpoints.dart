import 'package:shopping/app/networks/dio_client.dart';

enum EndPoints {
  login,
  register,
  getCustomerDetails,
  customerProduct,
  customerProductbycat,
  customerProductLike,
  customerProductUnlike,
  customerProductLikeDisplay,
  customerProductLikeDisplayAll,
  customerGetSingleProduct,
  customerCreateAdress,
  customerGetAdress,
  customerUpdateAdress,
  customerAddCart,
  customerDisplayCart,
  customerDeleteCart,
  booking,
}

extension EndPointsData on EndPoints {
  String path() {
    String path = "";
    switch (this) {
      case EndPoints.login:
        path = "customer/users/login";
      case EndPoints.register:
        path = "customer/users/signup";
      case EndPoints.getCustomerDetails:
        path = "customer/users/single";
      case EndPoints.customerProduct:
        path = "customer/products";
      case EndPoints.customerProductbycat:
        path = "customer/products";
      case EndPoints.customerProductLike:
        path = "customer/products/like";
      case EndPoints.customerProductUnlike:
        path = "customer/products/unlike";
      case EndPoints.customerProductLikeDisplay:
        path = "customer/products/like/display";
      case EndPoints.customerProductLikeDisplayAll:
        path = "customer/products/like/displayall";
      case EndPoints.customerGetSingleProduct:
        path = "customer/products/product";
      case EndPoints.customerCreateAdress:
        path = "customer/products/address/create";
      case EndPoints.customerGetAdress:
        path = "customer/products/address/display";
      case EndPoints.customerUpdateAdress:
        path = "customer/products/address/update";
      case EndPoints.customerAddCart:
        path = "customer/products/cart/create";
      case EndPoints.customerDisplayCart:
        path = "customer/products/cart/display";
      case EndPoints.customerDeleteCart:
        path = "customer/products/cart/delete";
      case EndPoints.booking:
        path = "customer/booking/addBooking";
    }
    return path;
  }

  ReqType type() {
    ReqType type;
    switch (this) {
      case EndPoints.login:
        type = ReqType.POST;
      case EndPoints.register:
        type = ReqType.POST;
      case EndPoints.getCustomerDetails:
        type = ReqType.GET;
      case EndPoints.customerProduct:
        type = ReqType.GET;
      case EndPoints.customerProductbycat:
        type = ReqType.GET;
      case EndPoints.customerProductLike:
        type = ReqType.POST;
      case EndPoints.customerProductUnlike:
        type = ReqType.POST;
      case EndPoints.customerProductLikeDisplay:
        type = ReqType.GET;
      case EndPoints.customerProductLikeDisplayAll:
        type = ReqType.GET;
      case EndPoints.customerGetSingleProduct:
        type = ReqType.GET;
      case EndPoints.customerCreateAdress:
        type = ReqType.POST;
      case EndPoints.customerGetAdress:
        type = ReqType.GET;
      case EndPoints.customerUpdateAdress:
        type = ReqType.PUT;
      case EndPoints.customerAddCart:
        type = ReqType.POST;
      case EndPoints.customerDisplayCart:
        type = ReqType.GET;
      case EndPoints.customerDeleteCart:
        type = ReqType.DELETE;
      case EndPoints.booking:
        type = ReqType.POST;
    }
    return type;
  }

  bool hasToken() {
    bool token = false;
    switch (this) {
      case EndPoints.login:
        token = false;
      case EndPoints.register:
        token = false;
      case EndPoints.getCustomerDetails:
        token = true;
      case EndPoints.customerProduct:
        token = false;
      case EndPoints.customerProductbycat:
        token = false;
      case EndPoints.customerProductLike:
        token = true;
      case EndPoints.customerProductUnlike:
        token = true;
      case EndPoints.customerProductLikeDisplay:
        token = true;
      case EndPoints.customerProductLikeDisplayAll:
        token = true;
      case EndPoints.customerGetSingleProduct:
        token = false;
      case EndPoints.customerCreateAdress:
        token = true;
      case EndPoints.customerGetAdress:
        token = true;
      case EndPoints.customerUpdateAdress:
        token = true;
      case EndPoints.customerAddCart:
        token = true;
      case EndPoints.customerDisplayCart:
        token = true;
      case EndPoints.customerDeleteCart:
        token = true;
      case EndPoints.booking:
        token = true;
    }
    return token;
  }
}
