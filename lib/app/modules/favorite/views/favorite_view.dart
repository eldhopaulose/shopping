
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/modules/details/views/details_view.dart';
import 'package:shopping/app/widgets/product_card.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white, // Added this line
        elevation: 0.0, // Added this line
        title: Center(
          child: Text(
            'Favorite',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 90, left: 10, right: 10),
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          shrinkWrap: true,
                          childAspectRatio:
                              MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
                          physics: NeverScrollableScrollPhysics(),
                          children: List.generate(20, (index) {
                            return InkWell(
                              onTap: () {
                            Get.to(DetailPageView());
                              },
                              child: ProductCard(
                                Id: index,
                              ),
                            );
                          }),
                        ),
                      ),
      ),
    );
  }
}
