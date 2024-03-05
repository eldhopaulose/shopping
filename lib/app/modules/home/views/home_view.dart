
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping/app/widgets/product_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width > 1200
              ? MediaQuery.of(context).size.width * 0.3
              : double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio:
                            MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
                      ),
                      children: const [
                        ProductCard(Id: 1,),
                        ProductCard(Id: 2,),
                        ProductCard(Id: 3,),
                        ProductCard(Id: 4,),
                        ProductCard(Id: 5,),
                        ProductCard(Id: 6,),
                        ProductCard(Id: 7,),
                        ProductCard(Id: 8,),
                        ProductCard(Id: 9,),
                        ProductCard(Id: 10,),
                        ProductCard(Id: 11,),
                       
               
                      ]),
                ),
              ],    
            ),
          ),
        ),
      ),
    );
  }
}         