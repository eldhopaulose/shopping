import 'package:dio/dio.dart';
import 'package:shopping/app/networks/dio_client.dart';
import 'package:shopping/app/networks/endpoints.dart';
import 'package:shopping/app/networks/network_model/req/booking_req.dart';
import 'package:shopping/app/networks/network_model/res/booking_res.dart';

class BookingRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<BookingRes?> booking(BookingReq bookingReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.booking,
        data: bookingReq.toJson(),
      );
      if (response.statusCode == 200) {
        final bookingResponse = BookingRes.fromJson(response.data);
        if (bookingResponse.booking != null) {
          return bookingResponse;
        } else {
          final bookingResponse =
              BookingRes(error: "Booking Not Done! Something wrong");
          return bookingResponse;
        }
      } else {
        final bookingResponse = BookingRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return bookingResponse;
        } else {
          return BookingRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return BookingRes(error: "Unexpected Error");
    }
  }
}
