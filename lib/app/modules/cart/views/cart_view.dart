import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopping/app/networks/network_model/res/customer_display_cart.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    controller.onInit();
    return Scaffold(
      //backgroundColor: Colors.black, // set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Added this line
        elevation: 0.0, // Added this line
        title: Center(
          child: Text(
            'My Cart',
            style: GoogleFonts.castoro(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              // You can set the color of the text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: controller.fetchCustomerCartDisplay,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.cart!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data!.cart![index];
                      controller.totalPrice.value +=
                          double.parse(item.product!.discount!);
                      return Dismissible(
                        key: Key(
                            item.sId!.toString()), // unique key for Dismissible
                        onDismissed: (direction) {
                          controller.onCartDelete(item.sId!);
                          Future.delayed(Duration(seconds: 1), () {
                            controller.fetchCustomerCartDisplayAll();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // add some space below each item
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 245,
                                247), // light gray background color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title:
                                Text(snapshot.data!.cart![index].product!.name!,
                                    style: GoogleFonts.grenze(
                                      // Set the font size to 20
                                      fontSize: 18,
                                    )),
                            subtitle: Text(
                                '₹ ${snapshot.data!.cart![index].product!.discount!}',
                                style: GoogleFonts.grenze(
                                  fontSize: 15,
                                )),
                            leading: Image.network(
                                snapshot.data!.cart![index].product!.image![0],
                                width: 100),
                            // trailing: Container(
                            //   padding: EdgeInsets.all(8.0), // Add some padding
                            //   decoration: BoxDecoration(
                            //     color: Colors.white, // Set the color of the box
                            //     borderRadius: BorderRadius.circular(
                            //         10), // Set the border radius
                            //     boxShadow: [
                            //       // Add a shadow effect
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.1),
                            //         spreadRadius: 5,
                            //         blurRadius: 7,
                            //         offset: Offset(0, 3),
                            //       ),
                            //     ],
                            //   ),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       IconButton(
                            //         icon: Icon(Icons.remove,
                            //             color: Colors.green, size: 15.0),
                            //         onPressed: () =>
                            //             controller.decreaseItemQuantity(
                            //                 index), // Increase the quantity
                            //       ),
                            //       Obx(() => Text(
                            //             controller.quantity.toString(),
                            //             style: TextStyle(
                            //                 fontSize: 17,
                            //                 fontWeight: FontWeight
                            //                     .bold), // Increase the font size to 24 and make it bold
                            //           )),
                            //       IconButton(
                            //         icon: Icon(Icons.add,
                            //             color: Colors.green, size: 15.0),
                            //         onPressed: () =>
                            //             controller.increaseItemQuantity(index),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  StreamBuilder(
                    stream: controller.fetchCustomerCartDisplay,
                    builder: (context, snapshot) {
                      return Text(
                        '₹ ${snapshot.data?.totalPrice.toString() ?? "0"}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 40, 167, 45),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 192, 243, 194),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed to Pay  ',
                      style: TextStyle(
                        color:
                            Colors.black, // Set the color of the text to black
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 15.0),
                  ],
                ),
                onPressed: () => controller.buyNow(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
