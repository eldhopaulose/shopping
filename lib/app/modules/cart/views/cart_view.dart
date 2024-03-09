
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopping/app/modules/cart/controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.white, // set background color to white
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10), // add some space below each item
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 231, 235), // light gray background color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text('Laptop'),
                      subtitle: Text('300'),
                      leading: Image.network('https://picsum.photos/250?image=9', width: 100),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () =>print('Laptop'),
                          ),
                          Text('4'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () =>print,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text('Total: 1500'),
            ),
           SizedBox(
            width: 150,
             child: FloatingActionButton(
                     
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
              Text('Proceed to Pay'),
              Icon(Icons.arrow_forward_ios),
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
