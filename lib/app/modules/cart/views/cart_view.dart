
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/modules/cart/controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      //backgroundColor: Colors.black, // set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Added this line
        elevation: 0.0, // Added this line
        title: Center(
          child: Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(index.toString()), // unique key for Dismissible
                    onDismissed: (direction) {
                      // remove the item from your data source here
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10), // add some space below each item
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 245, 247), // light gray background color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text('Laptop'),
                        subtitle: Text('300'),
                        leading: Image.network('https://picsum.photos/250?image=9', width: 100),
                        trailing: Container(
                          padding: EdgeInsets.all(8.0), // Add some padding
                          decoration: BoxDecoration(
                            color: Colors.white, // Set the color of the box
                            borderRadius: BorderRadius.circular(10), // Set the border radius
                            boxShadow: [ // Add a shadow effect
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                icon: Icon(Icons.remove, color: Colors.green, size: 15.0),
                              onPressed: () =>print('Laptop'),
                            ),
                            Text(
                              '4',
                                style: TextStyle(
                                  fontSize: 17, 
                                  fontWeight: FontWeight.bold
                                  ), // Increase the font size to 24 and make it bold
                            ),
                            IconButton(
                              icon: Icon(Icons.add, color: Colors.green, size: 15.0),
                              onPressed: () =>print,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ),
                    );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, 
                      fontSize: 20),
                  ),
                  Text(
                    '₹ 1500',
                    style: TextStyle(
                      color: Color.fromARGB(255, 40, 167, 45),
                      fontWeight: FontWeight.bold, 
                      fontSize: 20
                      ),
                  ),
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
                  color: Colors.black, // Set the color of the text to black
                ),
              ),
                Icon(Icons.arrow_forward_ios, color: Colors.black,size: 15.0),
                       ],
                     ),
                     onPressed: () => controller.buyNow(),
                   ),
           ),
           SizedBox(
             height: 20,)
          ],
        ),
      ),
    );
  }
}
